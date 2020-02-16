----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:51 04/03/2019 
-- Design Name: 
-- Module Name:    arbiter - Behavioral 
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

entity arbiter is
    Port ( data0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data2 : in  STD_LOGIC_VECTOR (3 downto 0);
           data3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  
			  datav0 : in  STD_LOGIC;
           datav1 : in  STD_LOGIC;
           datav2 : in  STD_LOGIC;
           datav3 : in  STD_LOGIC;
           
           wr_clk0 : in  STD_LOGIC;
			  wr_clk1 : in  STD_LOGIC;
			  wr_clk2 : in  STD_LOGIC;
			  wr_clk3 : in  STD_LOGIC;
			  
			  rd_clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  data_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  data_v_out : out  STD_LOGIC;
			  grant_t : out  STD_LOGIC_VECTOR (3 downto 0);
			  req_t	 : out  STD_LOGIC_VECTOR (3 downto 0);
			  ack_t	 : out std_logic;
			  rd_t : out STD_LOGIC_VECTOR (3 downto 0);
			  wr_t : out STD_LOGIC_VECTOR (3 downto 0);
			  emp_t : out STD_LOGIC_VECTOR (3 downto 0);
			  data_out_t : out STD_LOGIC_VECTOR (19 downto 0));
end arbiter;

architecture Behavioral of arbiter is

COMPONENT fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT rrarbiter
	PORT(
		clk : IN std_logic;
		rst_n : IN std_logic;
		req : IN std_logic_vector(3 downto 0);
		ack : IN std_logic;          
		grant : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;


signal dv0,dv1,dv2,dv3 : STD_LOGIC := '1';

signal wr_en0,wr_en1,wr_en2,wr_en3 : STD_LOGIC := '0';
signal din0 , din1, din2, din3 : STD_LOGIC_VECTOR(4 downto 0);

signal rd_en0,rd_en1,rd_en2,rd_en3 : STD_LOGIC := '0';
signal dout0 , dout1, dout2, dout3 : STD_LOGIC_VECTOR(4 downto 0);

signal empty0, empty1, empty2, empty3 : STD_LOGIC ;
signal full0, full1, full2, full3 : STD_LOGIC ;
signal prog_full0, prog_full1, prog_full2, prog_full3 : STD_LOGIC ;

signal req : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal ack : STD_LOGIC := '1' ;
signal grant : STD_LOGIC_VECTOR(3 downto 0) := "0000";
 

begin

f0 : fifo
  PORT MAP (
    rst => rst,
    wr_clk => wr_clk0,
    rd_clk => rd_clk,
    din => din0,
    wr_en => wr_en0,
    rd_en => rd_en0,
    dout => dout0,
    full => full0,
    empty => empty0,
    prog_full => prog_full0
  );

f1 : fifo
  PORT MAP (
    rst => rst,
    wr_clk => wr_clk1,
    rd_clk => rd_clk,
    din => din1,
    wr_en => wr_en1,
    rd_en => rd_en1,
    dout => dout1,
    full => full1,
    empty => empty1,
    prog_full => prog_full1
  );
  
f2 : fifo
  PORT MAP (
    rst => rst,
    wr_clk => wr_clk2,
    rd_clk => rd_clk,
    din => din2,
    wr_en => wr_en2,
    rd_en => rd_en2,
    dout => dout2,
    full => full2,
    empty => empty2,
    prog_full => prog_full2
  );
f3 : fifo
  PORT MAP (
    rst => rst,
    wr_clk => wr_clk3,
    rd_clk => rd_clk,
    din => din3,
    wr_en => wr_en3,
    rd_en => rd_en3,
    dout => dout3,
    full => full3,
    empty => empty3,
    prog_full => prog_full3
  );
  
Inst_rrarbiter: rrarbiter PORT MAP(
		clk => rd_clk,
		rst_n => rst,
		req => req,
		ack => ack,
		grant => grant 
	);

process(wr_clk0) is
begin
	if(rising_edge(wr_clk0)) then
		if dv0 = '1' or datav0 = '1' then
			wr_en0 <= '1';
			din0 <= datav0 & data0;
			dv0 <= datav0;
		else
			wr_en0 <= '0';
		end if;
		
	end if;
end process;

process(wr_clk1) is
begin
	if(rising_edge(wr_clk1)) then
		if dv1 = '1' or datav1 = '1' then
			wr_en1 <= '1';
			din1 <= datav1 & data1;
			dv1 <= datav1;
		else
			wr_en1 <= '0';
		end if;
				
	end if;
end process;

process(wr_clk2) is
begin
	if(rising_edge(wr_clk2)) then
		if dv2 = '1' or datav2 = '1' then
			wr_en2 <= '1';
			din2 <= datav2 & data2;
			dv2 <= datav2;
		else
			wr_en2 <= '0';
		end if;
	end if;
end process;

process(wr_clk3) is
begin
	if(rising_edge(wr_clk3)) then
		if dv3 = '1' or datav3 = '1' then
			wr_en3 <= '1';
			din3 <= datav3 & data3;
			dv3 <= datav3;
		else
			wr_en3 <= '0';
		end if;
	end if;
end process;

process(rd_clk,dout0,dout1,dout2,dout3) is
begin
	
	if(rising_edge(rd_clk)) then
		
		req <=  not(empty3) & not(empty2) & not(empty1) & not(empty0);
		
		if grant = "0001" then
			rd_en0 <= '1';
			rd_en1 <= '0';
			rd_en2 <= '0';
			rd_en3 <= '0';
			data_out <= dout0(3 downto 0);
			data_v_out <= dout0(4);
			
			ack <= not(dout0(4)); 
			
		elsif grant = "0010" then
			rd_en0 <= '0';
			rd_en1 <= '1';
			rd_en2 <= '0';
			rd_en3 <= '0';
			data_out <= dout1(3 downto 0);
			data_v_out <= dout1(4);
			
			ack <= not(dout1(4)); 
			
		elsif grant = "0100" then
			rd_en0 <= '0';
			rd_en1 <= '0';
			rd_en2 <= '1';
			rd_en3 <= '0';
			data_out <= dout2(3 downto 0);
			data_v_out <= dout2(4);
			
			ack <= not(dout2(4)); 
			
		elsif grant = "1000" then
			rd_en0 <= '0';
			rd_en1 <= '0';
			rd_en2 <= '0';
			rd_en3 <= '1';
			data_out <= dout3(3 downto 0);
			data_v_out <= dout3(4);
			
			ack <= not(dout3(4)); 
		else
			rd_en0 <= '0';
			rd_en1 <= '0';
			rd_en2 <= '0';
			rd_en3 <= '0';
			data_v_out <= '0';
			data_out <= "0000";
			ack <= '1';
		end if;
		
		
	end if;
end process;

grant_t <= grant;
req_t   <= req;
ack_t   <= ack;
wr_t <= wr_en3 & wr_en2 & wr_en1 & wr_en0 ;
rd_t <= rd_en3 & rd_en2 & rd_en1 & rd_en0 ;
emp_t <= empty3 & empty2 & empty1 & empty0 ;
data_out_t <= dout3 & dout2 & dout1 & dout0; 
 
end Behavioral;
