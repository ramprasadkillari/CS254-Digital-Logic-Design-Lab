----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:26 02/13/2019 
-- Design Name: 
-- Module Name:    gl2_top_module - Behavioral 
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

entity gl2_top_module is
port(
x : in std_logic_vector(37 downto 0);
sel : in std_logic_vector(2 downto 0);
o1 : out std_logic;
o2 : out std_logic_vector(3 downto 0)
);
end gl2_top_module;

architecture Behavioral of gl2_top_module is

COMPONENT gl2_priority_enc
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         O_2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
COMPONENT gl2_mux_6b
    PORT(
         I : IN  std_logic_vector(5 downto 0);
         S : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic
        );
    END COMPONENT;
	 
component gl2_fa is
port(
  a: in std_logic;
  b: in std_logic;
  c1: in std_logic;
  s: out std_logic;
  c2: out std_logic);
end component;

component gl2_comparator is
port(
  A: in std_logic_vector(15 downto 0);
  B: in std_logic_vector(15 downto 0);
  cl: out std_logic;
  cg: out std_logic;
  ce: out std_logic);
end component ;

component gl2_evenp is
Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           res : out  STD_LOGIC);
end component;

signal xpe_in : std_logic_vector(7 downto 0);
signal ope_out : std_logic_vector(3 downto 0);
signal Im_in : std_logic_vector(5 downto 0);
signal Sm_in : std_logic_vector(2 downto 0);
signal xep_in,Ac_in,Bc_in : std_logic_vector(15 downto 0);
signal Om_out,af_in,bf_in, c1f_in, sf_out, c2f_out, resep_out,clc_out,cgc_out,cec_out : std_logic;

begin

uut1 : gl2_priority_enc port map(x => xpe_in,O_2 => ope_out);
uut2 : gl2_mux_6b port map(I => Im_in ,S => Sm_in,O => Om_out);
uut3 : gl2_fa port map(a => af_in,b => bf_in,c1 => c1f_in, s => sf_out, c2 => c2f_out);
uut4 : gl2_evenp port map(X => xep_in, res => resep_out);
uut5 : gl2_comparator port map(A => Ac_in, B => Bc_in, cl => clc_out,cg => cgc_out,ce => cec_out);

process(x,sel,xpe_in,Im_in,Sm_in,af_in,bf_in,c1f_in,xep_in,Ac_in,Bc_in,ope_out,Om_out,sf_out,c2f_out,resep_out,clc_out,cgc_out,cec_out)
begin

xpe_in <= x(37 downto 30);
bf_in <= x(26) OR x(27) OR x(28) OR x(29) ;
af_in <= (x(20) AND x(21)) OR (x(22) AND x(23)) OR (x(24) AND x(25));
c1f_in <= '0';
Ac_in <= x(19 downto 4) XOR "1111111111111111";
Bc_in <= x(19 downto 4) XOR (resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out & resep_out );
Im_in <= c2f_out & sf_out & cec_out & cgc_out & clc_out & ((x(0) AND x(1)) OR not(x(2) and x(3)));
Sm_in <= sel;
o1 <= Om_out;
o2 <= ope_out;



end process;

end Behavioral;

