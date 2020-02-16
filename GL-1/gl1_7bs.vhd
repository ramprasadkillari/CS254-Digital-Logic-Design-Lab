----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:40:08 02/06/2019 
-- Design Name: 
-- Module Name:    gl1_7bs - Behavioral 
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

entity gl1_7bs is
PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
        );
end gl1_7bs;

architecture Behavioral of gl1_7bs is

COMPONENT gl1_7ba
    PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         c1 : IN  std_logic;
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
        );
    END COMPONENT;

signal A_in, B_in,S_out,S2_out: std_logic_vector(6 downto 0);
signal c1_in, c2_out,c3_out: std_logic;

begin

  -- Connect DUT
  ADDR7: gl1_7ba port map(A => A_in,B => B_in, c1 => c1_in, S => S_out, c2 => c2_out);
  ADDR8: gl1_7ba port map(A => "0000001",B => not(S_out),c1 => '0',S => S2_out, c2 => c3_out);
  process(A, B,A_in,B_in,S_out,S2_out, c1_in, c2_out,c3_out ) is
  begin		
    A_in <= A;
	 B_in <= not(B);
	 if (c2_out = '0') then
    	 S <= S2_out;
	 else
   	 S <= S_out;
	end if;
    c1_in <= '1'; 
	c2 <= not(c2_out);
	 end process;
end Behavioral;
