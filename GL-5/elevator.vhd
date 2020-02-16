----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:50 03/19/2019 
-- Design Name: 
-- Module Name:    module - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity module is
port(
out_reqtb    : in std_logic_vector(13 downto 0);
--out_reqtest  : out std_logic_vector(13 downto 0);
pres_state : out std_logic_vector(2 downto 0);
empty		  : out std_logic;
stop		  : out std_logic;  -- 1 => lift is open at a floor.
direc		  : out std_logic;  -- 1 for upward direction and 0 for downward
clk		  : in std_logic;
in_reqtb 	  : in std_logic_vector(6 downto 0)
--in_reqtest 	  : out std_logic_vector(6 downto 0)
);
end module;

architecture Behavioral of module is

signal p_state,n_state : std_logic_vector(2 downto 0) := "000";
signal out_req : std_logic_vector(13 downto 0) := "00000000000000";
signal in_req	: std_logic_vector(6 downto 0) := "0000000";
signal stp,drc,emp : std_logic := '1';

--signal :
begin

process(clk)
begin
p_state <= n_state;
end process;

process(out_reqtb,in_reqtb)
begin
--
--if 	(out_reqtb(1) = '1') then
--	out_req(1) <= '1';
--	out_req(0) <= out_reqtb(0);
--elsif (out_reqtb(3) = '1') then
--	out_req(3) <= '1';
--elsif (out_reqtb(5) = '1') then
--	out_req(5) <= '1';
--elsif (out_reqtb(7) = '1') then
--	out_req(7) <= '1';
--elsif (out_reqtb(9) = '1') then
--	out_req(9) <= '1';
--elsif (out_reqtb(11) = '1') then
--	out_req(11) <= '1';
--elsif (out_reqtb(13) = '1') then
--	out_req(13) <= '1';
--end if;	
--
--if 	(in_reqtb(0) = '1') then
--	in_req(0) <= '1';
--elsif (in_reqtb(1) = '1') then
--	in_req(1) <= '1';
--elsif (in_reqtb(2) = '1') then
--	in_req(2) <= '1';
--elsif (in_reqtb(3) = '1') then
--	in_req(3) <= '1';
--elsif (in_reqtb(4) = '1') then
--	in_req(4) <= '1';
--elsif (in_reqtb(5) = '1') then
--	in_req(5) <= '1';
--elsif (in_reqtb(6) = '1') then
--	in_req(6) <= '1';
--end if;	

for I in 0 to 6 loop
	if 	(out_reqtb(2*I+1) = '1') then
		out_req(2*I+1) <= '1';
		out_req(2*I) <= out_reqtb(2*I);
	end if;
end loop;

for I in 0 to 6 loop 
	if (in_reqtb(I) = '1') then
		in_req(I) <= '1';
	end if;
end loop;

end process;


process(out_req,in_req,p_state)
variable prior,n_prior : std_logic_vector(2 downto 0) := "101";
variable prior_d : std_logic := '1';
variable temp : integer range 0 to 6 := 0;
begin
if(emp = '1') then
	if(p_state > prior) then
			drc <= '0';
			if(p_state = "000") then
				n_state <= p_state;
			else
				n_state <= p_state-1;
			end if;
			if(prior_d = '0') then
				--if([[out_req(p_state+1 to 6) or out_req(prior-1 to 0) and upward dir ,or out_req(p_state to prior and upward direction)) then update n_prior n_prior <= 
				temp := to_integer(unsigned(p_state));
				if(out_req(13-2*temp) = '1' and out_req(12-2*temp) = '0') then
					stp <= '1' ;
					out_req(13-2*temp) <= '0';
				else
					stp <= '0';
				end if;
			else
				--if(out_req(prior-1 to 0) or out_req(p_state to prior and downward direction) or (out_req(p_state+1 to 6))) then update n_prior
			end if;
	elsif(p_state < prior) then
			drc <= '1';
			if(p_state = "110") then
				n_state <= p_state;
			else
				n_state <= p_state+1;
			end if;
			if(prior_d = '1') then
			--if(out_req(p_state-1 to 0) or out_req(p_state to prior and downward direction) or (out_req(prior+1 to 6) and downward)) then update n_prior
				temp := to_integer(unsigned(p_state));
				if(out_req(13-2*temp) = '1' and out_req(12-2*temp) = '1') then
					stp <= '1' ;
					out_req(13-2*temp) <= '0';
				else
					stp <= '0';
				end if;
			else
				--if(out_req(p_state-1 to 0) and upward dir or out_req(p_state to prior and upward direction) or (out_req(prior+1 to 6))) then update n_prior
			end if;	
	else
			stp <= '1';
			emp <= '0';
			-- update n_prior and prior again. Create a variable to detrmine when to use the commented if else in above code block.
			if(prior_d = '0') then
				drc <= '0';
				if(p_state = "000") then
					n_state <= p_state;
				else
					n_state <= p_state-1;
				end if;

			else
				drc <= '1';
				if(p_state = "110") then
					n_state <= p_state;
				else
					n_state <= p_state+1;
				end if;
			end if;
	end if;
else		
	if(drc = '1') then
			temp := to_integer(unsigned(p_state));
			if(out_req(13-2*temp) = '1' and out_req(12-2*temp) = '1') then
				stp <= '1' ;
				out_req(13-2*temp) <= '0';
			end if;
			if(in_req(6-temp) = '1') then
				stp <= '1';
				in_req(6-temp) <= '0';
			end if;
			if(p_state = "110") then
				n_state <= p_state;
			else
				n_state <= p_state+1;
			end if;
	else 
			temp := to_integer(unsigned(p_state));
			if(out_req(13-2*temp) = '1' and out_req(12-2*temp) = '0') then
				stp <= '1' ;
				out_req(13-2*temp) <= '0';
			end if;
			if(in_req(6-temp) = '1') then
				stp <= '1';
				in_req(6-temp) <= '0';
			end if;
				if(p_state = "000") then
					n_state <= p_state;
				else
					n_state <= p_state-1;
				end if;
	
	end if;

	
		
end if;
end process;

pres_state <= p_state;
stop 		  <= stp;
direc		  <= drc;
empty		  <= emp;
--out_reqtest <= out_req;
--in_reqtest <= in_req;


end Behavioral;
--
--if 	(out_reqtb(1) = '1') then
--	out_req(1) <= '1';
--elsif (out_reqtb(3) = '1') then
--	out_req(3) <= '1';
--elsif (out_reqtb(5) = '1') then
--	out_req(5) <= '1';
--elsif (out_reqtb(7) = '1') then
--	out_req(7) <= '1';
--elsif (out_reqtb(9) = '1') then
--	out_req(9) <= '1';
--elsif (out_reqtb(11) = '1') then
--	out_req(11) <= '1';
--elsif (out_reqtb(13) = '1') then
--	out_req(13) <= '1';
--end if;	
--
--if 	(in_reqtb(0) = '1') then
--	in_req(0) <= '1';
--elsif (in_reqtb(1) = '1') then
--	in_req(1) <= '1';
--elsif (in_reqtb(2) = '1') then
--	in_req(2) <= '1';
--elsif (in_reqtb(3) = '1') then
--	in_req(3) <= '1';
--elsif (in_reqtb(4) = '1') then
--	in_req(4) <= '1';
--elsif (in_reqtb(5) = '1') then
--	in_req(5) <= '1';
--elsif (in_reqtb(6) = '1') then
--	in_req(6) <= '1';
--end if;	