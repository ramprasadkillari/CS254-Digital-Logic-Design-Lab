----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:20 05/01/2019 
-- Design Name: 
-- Module Name:    write - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity write_orig is
generic ( N : integer := 30 ); 
port(
	iData_av         : in  std_logic;               
	Wr_complete      : in  std_logic;            
	Ack_sent         : in  std_logic;         
	clk              : in  std_logic;    
	rst              : in  std_logic;   	
	Input_port       : in  std_logic_vector(4 downto 0);
	iData            : in  std_logic_vector(143 downto 0);      
	opcode           : in  std_logic_vector(2 downto 0);   
	iRd_Data         : out std_logic; 
	Rd_opcode        : out std_logic;         
	Wr_valid         : out std_logic; 
	Send_wr_ack      : out std_logic	;
	Write_Data       : out std_logic_vector(511 downto 0);
	Table_number     : out std_logic_vector(7 downto 0);            
	Table_address    : out std_logic_vector(15 downto 0);
	Sequence_number  : out std_logic_vector(15 downto 0);
	Output_port      : out std_logic_vector(4 downto 0)
--	stat				  : out std_logic_vector(3 downto 0);
--	counter          : out integer;
--	Write_Data_test  : out std_logic_vector(719 downto 0);
--	vara				  : out integer
);
end write_orig;

architecture Behavioral of write_orig is

type states is (IDLE,READ_1,EXTRACT_SEQ,READ_2,EXTRACT_TABLE,EXTRACT_DATA,WRITE_1,END_WRITE,WAIT_FOR_EOP);
signal Table_address_t, Sequence_number_t							 : std_logic_vector(15 downto 0) := (others => '0');
signal Table_number_t                    							 : std_logic_vector(7 downto 0)  := (others => '0');
signal Write_Data_t                      		 					 : std_logic_vector(719 downto 0):= (others => '0');
signal iRd_Data_t,Rd_opcode_t,Wr_valid_t,Send_wr_ack_t		 : std_logic := '0';
signal Output_port_t 													 : std_logic_vector(4 downto 0) := (others => '0');
signal stat_t                              						 : std_logic_vector(3 downto 0) := (others => '0');
signal ctrs,vara_t,vara_tq														 : integer := 0;
begin

--
-- PACKET STRUCTURE : 6 6 2 2, 2  2N  6   1       1        46-1500
--                             Sq       Tb.No  No.entr Data (1st 2B table address)

-- 128 bits  : iData(142 downto 135) & iData(133 downto 126) & iData(124 downto 117) & iData(115 downto 108) & iData(106 downto 99) & iData(97 downto 90) & iData(88 downto 81) & iData(79 downto 72) & iData(70 downto 63) & iData(61 downto 54) & iData(52 downto 45) & iData(43 downto 36) & iData(34 downto 27) & iData(25 downto 18) & iData(16 downto 9) & iData(7 downto 0);
-- 16 bits   : iData(143) = '0' or iData(134) = '0' or iData(125) = '0' or iData(116) = '0' or iData(107) = '0' or iData(98) = '0' or iData(89) = '0' or iData(80) = '0' or iData(71) = '0' or iData(62) = '0' or iData(53) = '0' or iData(44) = '0' or iData(35) = '0' or iData(26) = '0' or iData(17) = '0' or iData(8) = '0') then
 -- if(iData(135) = '0' or iData(126) = '0' or iData(117) = '0' or iData(108) = '0' or iData(99) = '0' or iData(90) = '0' or iData(81) = '0' or iData(72) = '0' or iData(63) = '0' or iData(54) = '0' or iData(45) = '0' or iData(36) = '0' or iData(27) = '0' or iData(18) = '0' or iData(9) = '0' or iData(0) = '0') then
-- Table Number                 Data to extract
--   1        Forwarding table    60 B
--   2        Port Info table      4 B
--   3        Multicast table     16 B
--   4        Flash table         64 B
--   5        Device info          2 B
--   6        CFM table           34 B
--   7        Rate Limit table     8 B
--   8        reset                1 B
--   9        Authentication      20 B


-- State Encoding
-- IDLE                      0000
-- READ_1                    0001
-- EXTRACT_SEQ               0010
-- READ_2                    0011
-- EXTRACT_TABLE             0100
-- EXTRACT_DATA              0101
-- WRITE_1                   0110
-- END_WRITE                 0111
-- WAIT_FOR_EOP              1000


process(clk)
variable p_state, n_state : states := IDLE;
variable ctr,ind1,ind2 : Integer := 0;
variable eop,helper,helper2 : std_logic := '0';
variable Write_Data_f : std_logic_vector(511 downto 0):= (others => '0');
begin
if(rising_edge(clk)) then
	if(rst = '1') then
		n_state := IDLE;
		stat_t <= "0000";
		iRd_Data_t <= '0';
		Rd_opcode_t <= '0';
		Write_Data <= (others => '0');
		Table_number <= (others => '0');
		Table_address <= (others => '0');
		Sequence_number <= (others => '0');
		Output_port_t <= (others => '0');
		Wr_valid_t <= '0';
		Send_wr_ack_t <= '0';
		helper := '0';
	   helper2 := '0';
	else		
		vara_tq <= 1;
		case p_state is 
			when IDLE   	     =>
				stat_t <= "0000";
				iRd_Data_t <= '0';
				Rd_opcode_t <= '0';
				Write_Data <= (others => '0');
				Table_number <= (others => '0');
				Table_address <= (others => '0');
				Sequence_number <= (others => '0');
				Output_port_t <= (others => '0');
				Wr_valid_t <= '0';
				Send_wr_ack_t <= '0';
				if(helper='0' and Wr_complete = '1') then
					helper := '1';
				end if;
				if( iData_av = '1' and opcode = "011" and helper='0') then
					if(Wr_complete = '1') then
						Rd_opcode_t <= '0';
						iRd_Data_t <= '1';
						n_state := READ_1;
						helper := '0';
					else
						n_state := IDLE;
						Rd_opcode_t <= '0';
					end if;
				elsif( iData_av = '1' and opcode = "011" and helper='1') then
					Rd_opcode_t <= '0';
					iRd_Data_t <= '1';
					n_state := READ_1;
					helper := '0';
				else
					n_state := IDLE;
					Rd_opcode_t <= '0';
				end if;
			when READ_1 	     =>
				stat_t <= "0001";
				n_state := EXTRACT_SEQ;
			when EXTRACT_SEQ    =>
				stat_t <= "0010";
				Sequence_number_t <= iData(142 downto 135) & iData(133 downto 126) ; -- first 2B of iData
				n_state := READ_2;
				ctr := 14; -- ctr indicates the number of bytes read out of 2*N
			when READ_2         =>
				stat_t <= "0011";
				if(ctr < 2*N-9) then
					ctr := ctr + 16;
					vara_t <= 2*N-9;
					if(ctr < 2*N-9) then
						n_state := READ_2;
						vara_t <= 1;
					else
						n_state := EXTRACT_TABLE;
						vara_t <= 0;
					end if;
				else
					n_state := EXTRACT_TABLE;
				end if;
			when EXTRACT_TABLE  =>
				stat_t <= "0100";
				if(helper = '0') then -- ensures Table number is calculated only once. Extract table state may repeat twice.
					Table_number_t <= iData((142-(2*N-ctr+6)*9) downto (142-((2*N-ctr+6)*9+7)));
					helper := '1';
					vara_t <= (2*N-ctr+6)*9;
				end if;
					ctr := ctr+16;
					if(ctr <= 2*N+8) then
						n_state := EXTRACT_TABLE;
--					elsif(ctr = 2*N+9) then
--						Table_address_t(7 downto 0) <= iData(142 downto 135);
--						n_state := EXTRACT_DATA;
					elsif(ctr = 2*N+10) then
						Table_address_t(15 downto 0) <= iData(16 downto 9) & iData(7 downto 0);
						n_state := EXTRACT_DATA;
						ind1 := 0;
					else
						Table_address_t(15 downto 0) <= iData((142-(2*N+24-ctr)*9) downto (142-((2*N+24-ctr)*9+7))) & iData((142-(2*N+25-ctr)*9) downto (142-((2*N+25-ctr)*9+7)));
						n_state := EXTRACT_DATA;				
						ind1 := ctr-2*N;
						--slic0 : for k in (143-((ind1-10)*9-1)) to 143 
						Write_Data_t(719 downto (719-((ind1-10)*9-1))) <= iData((ind1-10)*9-1 downto 0);
						ind1 := (ind1-10)*9;  -- ind1 indicates the number of bits extracted for Write_Data including validity bits

					end if;
				
			when EXTRACT_DATA   =>
				stat_t <= "0101";
				vara_t <= 0;
				case Table_number_t is 
					when "00000001" => --   1			Forwarding table	  60 B
						if(ind1 >= 540) then
							n_state := WRITE_1;
						else
							
							--Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 540) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;
					when "00000010" => --   2        Port Info table      4 B
						if(ind1 >= 36) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 36) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00000011" => --   3        Multicast table     16 B
						if(ind1 >= 144) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 144) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00000100" => --   4        Flash table         64 B
						if(ind1 >= 576) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 576) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00000101" => --   5        Device info          2 B
						if(ind1 >= 18) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 18) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00000110" => --   6        CFM table           34 B
						if(ind1 >= 306) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 306) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00000111" => --   7        Rate Limit table     8 B
						if(ind1 >= 72) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 72) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
					when "00001000" => --   8        reset                1 B
						if(ind1 >= 9) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 9) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;					
						
					when "00001001" => --   9        Authentication      20 B 
						if(ind1 >= 180) then
							n_state := WRITE_1;
						else
							
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 180) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;							
							n_state := EXTRACT_DATA;
						end if;
					when others =>	
						if(ind1 >= 540) then
							n_state := WRITE_1;
						else						
							vara_t <= ind1;
							Write_Data_t((719-ind1) downto (576-ind1)) <= iData;
							ind1 := ind1 + 144;
							if(ind1 >= 540) then
								vara_t <= ind1;
								n_state := WRITE_1;							
							else
								vara_t <= ind1+1;
								n_state := EXTRACT_DATA;
							end if;
						end if;
				end case;
				
			when WRITE_1        =>
				stat_t <= "0110";
-- EOP combinational logic
--				if(eop = '0') then
				if(iData(143) = '0' or iData(134) = '0' or iData(125) = '0' or iData(116) = '0' or iData(107) = '0' or iData(98) = '0' or iData(89) = '0' or iData(80) = '0' or iData(71) = '0' or iData(62) = '0' or iData(53) = '0' or iData(44) = '0' or iData(35) = '0' or iData(26) = '0' or iData(17) = '0' or iData(8) = '0') then
					eop := '1';
				else
					eop := '0';
				end if;
--				end if;
-----------------------------
				if(eop = '1') then
					if(helper2 = '1') then  -- helper2 ensures Rd_opcode is set high only for one clock cycle
						Rd_opcode_t <= '0';
					else
						Rd_opcode_t <= '1';
						helper2 := '1';
					end if;
				end if;
----------------------------	
				if(Wr_complete = '0') then
					Wr_valid_t <= '1';
					Table_number    <= Table_number_t;
					Table_address   <= Table_address_t;
					
					if(helper = '1') then
						case Table_number_t is 
							when "00000001" => --   1			Forwarding table	  60 B	
								wr1 : for k in 0 to 59 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr1;
							when "00000010" => --   2        Port Info table      4 B
								wr2 : for k in 0 to 3 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr2;						
							when "00000011" => --   3        Multicast table     16 B
								wr3 : for k in 0 to 15 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr3;						
							when "00000100" => --   4        Flash table         64 B
								wr4 : for k in 0 to 63 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr4;						
							when "00000101" => --   5        Device info          2 B
								wr5 : for k in 0 to 1 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr5;						
							when "00000110" => --   6        CFM table           34 B
								wr6 : for k in 0 to 33 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr6;						
							when "00000111" => --   7        Rate Limit table     8 B	
								wr7 : for k in 0 to 7 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr7;						
							when "00001000" => --   8        reset                1 B
									Write_Data_f(7 downto 0) := Write_Data_t(7 downto 0);
							when "00001001" => --   9        Authentication      20 B 
								wr9 : for k in 0 to 19 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr9;	
							when others =>
								wr10 : for k in 0 to 59 loop
									Write_Data_f((511-k*8) downto (511-(k*8+7)) ) := Write_Data_t((718-k*9) downto (718-(k*9+7)));
								end loop wr10;
						end case;
						helper := '0';
					end if;
					
					Write_Data <= Write_Data_f;
					n_state := WRITE_1;
					
				else
					n_state := END_WRITE;
					Wr_valid_t <= '0';
					Sequence_number <= Sequence_number_t;
					Output_port_t <= Input_port;
					Send_wr_ack_t <= '1';					
				end if;
			when END_WRITE      =>
				stat_t <= "0111";
-- EOP combinational logic
--				if(eop = '0') then
				if(iData(143) = '0' or iData(134) = '0' or iData(125) = '0' or iData(116) = '0' or iData(107) = '0' or iData(98) = '0' or iData(89) = '0' or iData(80) = '0' or iData(71) = '0' or iData(62) = '0' or iData(53) = '0' or iData(44) = '0' or iData(35) = '0' or iData(26) = '0' or iData(17) = '0' or iData(8) = '0') then

					eop := '1';
				else
					eop := '0';
				end if;
--				end if;
-----------------------------
				if(eop = '1') then
					if(helper2 = '1') then  -- helper2 ensures Rd_opcode is set high only for one clock cycle
						Rd_opcode_t <= '0';
					else
						Rd_opcode_t <= '1';
						helper2 := '1';
					end if;
				end if;
----------------------------				
				if(Ack_sent = '0') then
					Sequence_number <= Sequence_number_t;
					Output_port_t <= Input_port;
					Send_wr_ack_t <= '1';
					n_state		:= END_WRITE;
				elsif(Ack_sent = '1' and eop = '1') then
					Send_wr_ack_t <= '0';
					n_state    := IDLE;
				else
					n_state    := WAIT_FOR_EOP;
				end if;
			when WAIT_FOR_EOP   =>
				stat_t <= "1000";
-- EOP combinational logic
				if(iData(143) = '0' or iData(134) = '0' or iData(125) = '0' or iData(116) = '0' or iData(107) = '0' or iData(98) = '0' or iData(89) = '0' or iData(80) = '0' or iData(71) = '0' or iData(62) = '0' or iData(53) = '0' or iData(44) = '0' or iData(35) = '0' or iData(26) = '0' or iData(17) = '0' or iData(8) = '0') then
					eop := '1';
				else
					eop := '0';
				end if;
-----------------------------				
				if(eop = '0') then
					n_state := WAIT_FOR_EOP;
				else
					n_state := IDLE;
					Rd_opcode_t <= '1';
				end if;
		end case;

--if(n_state = EXTRACT_TABLE) then
--	vara_t <= 3;
--else
--	vara_t <= 2;
--end if;
		p_state := n_state;
		ctrs <= ctr;
--		if(eop = '1') then
--			vara <= 1;
--		else
--			vara <= 0;
--		end if;	
--	vara <= vara_tq;
	end if;
end if;	
end process;

Output_port		 <= Output_port_t;
Rd_opcode 		 <= Rd_opcode_t;
Send_wr_ack 	 <= Send_wr_ack_t;
--Write_Data      <= Write_Data_t;
--Sequence_number <= Sequence_number_t;
--Table_address	 <= Table_address_t;
--Table_number	 <= Table_number_t;
Wr_valid			 <= Wr_valid_t;
iRd_Data			 <= iRd_Data_t;
--stat <= stat_t;
--counter <= ctrs;
--vara <= vara_t;
--Write_Data_test <= Write_Data_t;
end Behavioral;