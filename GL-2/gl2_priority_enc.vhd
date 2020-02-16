----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:29 02/13/2019 
-- Design Name: 
-- Module Name:    gl2_priority_enc - Behavioral 
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

entity gl2_priority_enc is
port(
x: in std_logic_vector(7 downto 0);
O_2: out std_logic_vector(3 downto 0));
end gl2_priority_enc;

architecture Behavioral of gl2_priority_enc is
begin
-- x(31) 0 to x(38) 7 
-- V
O_2(0) <= x(0) OR x(1) OR x(2) OR x(3) OR x(4) OR x(5) OR  x(6) OR x(7);
-- c
O_2(1) <= x(7) OR ( not(x(6)) AND (x(5) OR (not(x(4)) AND (x(3) OR (x(1) and not(x(2)))))));
-- b
O_2(2) <= x(6) OR x(7) OR ((x(2) OR x(3)) AND not(x(4) OR x(5)));
--a
O_2(3) <= x(4) OR x(5) OR  x(6) OR x(7);


end Behavioral;

