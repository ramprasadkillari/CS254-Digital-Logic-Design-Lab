----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:17 02/06/2019 
-- Design Name: 
-- Module Name:    gl1_7ba - Behavioral 
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

entity gl1_7ba is
port(
  A: in std_logic_vector(6 downto 0);
  B: in std_logic_vector(6 downto 0);
  c1: in std_logic;
  S: out std_logic_vector(6 downto 0);
  c2: out std_logic);
end gl1_7ba;

architecture rtl of gl1_7ba is

component gl1_fa is
port(
  a: in std_logic;
  b: in std_logic;
  c1: in std_logic;
  s: out std_logic;
  c2: out std_logic);
end component;

signal A_in, B_in, S_out: std_logic_vector(6 downto 0);
signal c_in, c0_out, c1_out, c2_out, c3_out, c4_out, c5_out, c6_out : std_logic;

begin

ADDR0: gl1_fa port map(a => A_in(0), b=> B_in(0), c1 => c_in, s => S_out(0), c2 => c0_out );
ADDR1: gl1_fa port map(a => A_in(1), b=> B_in(1), c1 => c0_out, s => S_out(1), c2 => c1_out );
ADDR2: gl1_fa port map(a => A_in(2), b=> B_in(2), c1 => c1_out, s => S_out(2), c2 => c2_out );
ADDR3: gl1_fa port map(a => A_in(3), b=> B_in(3), c1 => c2_out, s => S_out(3), c2 => c3_out );
ADDR4: gl1_fa port map(a => A_in(4), b=> B_in(4), c1 => c3_out, s => S_out(4), c2 => c4_out );
ADDR5: gl1_fa port map(a => A_in(5), b=> B_in(5), c1 => c4_out, s => S_out(5), c2 => c5_out );
ADDR6: gl1_fa port map(a => A_in(6), b=> B_in(6), c1 => c5_out, s => S_out(6), c2 => c6_out );

  process(A, B, c1, c_in,A_in, B_in, S_out, c0_out, c1_out, c2_out, c3_out, c4_out, c5_out, c6_out ) is
  begin
  	A_in <= A;
    B_in <= B;
    c_in <= c1;
    S <= S_out;
    c2 <= c6_out;
  end process;
end rtl;

