----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:00 02/13/2019 
-- Design Name: 
-- Module Name:    mux_8 - Behavioral 
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

entity gl2_mux_6b is
port(
I: in std_logic_vector(5 downto 0);
S: in std_logic_vector(2 downto 0);
O: out std_logic); 
end gl2_mux_6b;

architecture Behavioral of gl2_mux_6b is

begin
process(I,S) is
begin
    O <= (I(0) and not(S(2)) and not(S(1)) and not(S(0))) or
	 (I(1) and not(S(2)) and not(S(1)) and S(0)) or
	 (I(2) and not(S(2)) and S(1) and not(S(0))) or 
	 (I(3) and not(S(2)) and S(1) and S(0)) or
	 (I(4) and S(2) and not(S(1)) and not(S(0))) or
	 (I(5) and S(2) and not(S(1)) and S(0));
end process;
end Behavioral;