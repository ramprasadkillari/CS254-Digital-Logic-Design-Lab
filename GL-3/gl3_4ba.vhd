----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:16 03/06/2019 
-- Design Name: 
-- Module Name:    gl3_4ba - Behavioral 
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

entity gl3_4ba is
port(A:in std_logic_vector(3 downto 0);
	  B:in std_logic_vector(3 downto 0);
	  add:in std_logic;
	  clk:in std_logic;
	  sum:out std_logic_vector(3 downto 0);
	  carry:out std_logic;
	  valid:out std_logic
	  );
end gl3_4ba;

architecture Behavioral of gl3_4ba is
signal A_reg,B_reg,S_reg,V_reg:std_logic_vector(3 downto 0);
signal carry_out :std_logic;

begin

process(clk)
variable s:std_logic;
begin
if(clk='1' and clk'EVENT) then

	if(add='1') then
		A_reg <= A;
		B_reg <= B;
		carry_out <= '0';
		S_reg <= "0000";
		V_reg <= "1000";
		sum <= "0000";
		carry <= '0';
		valid <= '0';
	else
		A_reg <= (A_reg(0) & A_reg(3 downto 1));
		B_reg <= (B_reg(0) & B_reg(3 downto 1));
		s := A_reg(0) xor B_reg(0) xor carry_out;
		carry_out <= ((A_reg(0) xor B_reg(0)) and carry_out) or (A_reg(0) and B_reg(0));
		S_reg <= (s & S_reg(3 downto 1));
		V_reg <= (V_reg(0) & V_reg(3 downto 1));
		
		if(V_reg(0)='1')then
			sum <= (s & S_reg(3 downto 1));
			carry <= carry_out;
			carry_out <= '0';
			valid <= '1';
		end if;
	end if;
	
end if;
end process;
end Behavioral;

