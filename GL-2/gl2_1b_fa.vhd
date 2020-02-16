----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:28 02/13/2019 
-- Design Name: 
-- Module Name:    gl2_1b_fa - Behavioral 
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

entity gl2_fa is
port(
  a: in std_logic;
  b: in std_logic;
  c1: in std_logic;
  s: out std_logic;
  c2: out std_logic);
end gl2_fa;

architecture rtl of gl2_fa is
signal temp:std_logic;
begin
  process(a, b, c1, temp) is
  begin
  	temp <= (a and not(b)) or (b and not(a));
    s <= (temp and not(c1)) or (c1 and not(temp));
    c2 <= (c1 and temp) or (a and b);
  end process;
end rtl;