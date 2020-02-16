


-- ganit code

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:19 02/06/2019 
-- Design Name: 
-- Module Name:    gl1_gan - Behavioral 
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

entity gl1_gan is
port(
  A: in std_logic_vector(6 downto 0);
  B: in std_logic_vector(6 downto 0);
  S1: in std_logic;
  S2: in std_logic;
  S3: in std_logic;
  C: out std_logic_vector(7 downto 0);
  BCD: out std_logic_vector(11 downto 0)
  );
end gl1_gan;

architecture Behavioral of gl1_gan is

component gl1_7ba is
port(
     A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         c1 : IN  std_logic;
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
			);
end component;

COMPONENT gl1_7bs
    PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
        );
END COMPONENT;

component ql1_mul is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           ot : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component gl1_bcd is
port(
A:in std_logic_vector(7 downto 0);
B:out std_logic_vector(11 downto 0)
);
end component;

signal A_in, B_in, S_out: std_logic_vector(6 downto 0);
signal c2_out: std_logic;

signal SA_in, SB_in, SS_out: std_logic_vector(6 downto 0);
signal Sc2_out: std_logic;
signal MA_in, MB_in: std_logic_vector(3 downto 0); 
signal MS_out: std_logic_vector(6 downto 0);
signal BCD_out: std_logic_vector(11 downto 0);
signal BCD_in: std_logic_vector(7 downto 0);
begin
ADDR0: gl1_7ba port map(a => A_in, b => B_in, c1 => '0', s => S_out, c2 => c2_out );

SUBT0: gl1_7bs port map(A => SA_in, B => SB_in,s => SS_out,c2 => Sc2_out);

MULT0: ql1_mul port map(A => MA_in, B => MB_in, ot => MS_out); 

BCD0: gl1_bcd port map(A => BCD_in,B => BCD_out);
process(A,B,A_in,B_in,S_out,c2_out,SA_in,SB_in,SS_out,Sc2_out,MA_in,MB_in,MS_out,BCD_out,BCD_in)
begin
  if ((S1 = '0') and (S2 = '0')) then
       A_in <= A;
		 B_in <= B;
	    C <= c2_out & S_out;
		 BCD_IN <= c2_out & S_out;
      BCD <= BCD_out;
  elsif ((S1 = '0') and (S2 ='1')) then
       SA_in <= A; 
       SB_in <= B;
		 C <= Sc2_out & SS_out;
		 BCD_IN <= '0' & SS_out;
     BCD <= BCD_out;
   elsif ((S1 = '1') and (S2 ='0')) then
      MA_in(0) <= A(0);
		MA_in(1) <= A(1);
		MA_in(2) <= A(2);
		MA_in(3) <= A(3);
		MB_in(0) <= B(0);
		MB_in(1) <= B(1);
		MB_in(2) <= B(2);
		MB_in(3) <= B(3);
		C <= '0' & MS_out;
		BCD_IN <= '0' & MS_out;
    BCD <= BCD_out;	 
  else
      MA_in(0) <= A(0);
		MA_in(1) <= A(1);
		MA_in(2) <= A(2);
		MA_in(3) <= A(3);
		MB_in(0) <= B(0);
		MB_in(1) <= B(1);
		MB_in(2) <= B(2);
		MB_in(3) <= B(3);
		C <= '0' & MS_out;
		BCD_IN <= '0' & MS_out;
    BCD <= BCD_out;
end if;
end process;
end Behavioral;


