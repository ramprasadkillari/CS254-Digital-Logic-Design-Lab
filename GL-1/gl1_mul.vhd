----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:41 02/06/2019 
-- Design Name: 
-- Module Name:    ql1_mul - Behavioral 
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

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:21 02/06/2019 
-- Design Name: 
-- Module Name:    seven_bit_adder - Behavioral 
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

entity ql1_mul is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           ot : out  STD_LOGIC_VECTOR (6 downto 0));
end ql1_mul;

architecture Behavioral of ql1_mul is
component gl1_7ba is 
port(A : in STD_LOGIC_VECTOR(6 downto 0);
B : in STD_LOGIC_VECTOR(6 downto 0);
c1 : in STD_LOGIC;
S : out STD_LOGIC_VECTOR(6 downto 0);
c2 : out STD_LOGIC
);
end component;
signal si : STD_LOGIC_VECTOR(6 downto 0);
signal si1 : STD_LOGIC_VECTOR(6 downto 0);
signal si2 : STD_LOGIC_VECTOR(6 downto 0);
signal si3 : STD_LOGIC_VECTOR(6 downto 0);
signal ot1 : STD_LOGIC_VECTOR(6 downto 0);
signal ot2 : STD_LOGIC_VECTOR(6 downto 0);
signal car : STD_LOGIC_VECTOR(2 DOWNTO 0);
begin
si(0) <= A(0) and B(0);
si(1) <= A(1) and B(0);
si(2) <= A(2) and B(0);
si(3) <= A(3) and B(0);
si(4) <= '0';
si(5) <= '0';
si(6) <= '0';

si1(0) <= '0';
si1(1) <= A(0) and B(1);
si1(2) <= A(1) and B(1);
si1(3) <= A(2) and B(1);
si1(4) <= A(3) and B(1);
si1(5) <= '0';
si1(6) <= '0';

si2(0) <= '0';
si2(1) <= '0';
si2(2) <= A(0) and B(2);
si2(3) <= A(1) and B(2);
si2(4) <= A(2) and B(2);
si2(5) <= A(3) and B(2);
si2(6) <= '0';

si3(0) <= '0';
si3(1) <= '0';
si3(2) <= '0';
si3(3) <= A(0) and B(3);
si3(4) <= A(1) and B(3);
si3(5) <= A(2) and B(3);
si3(6) <= A(3) and B(3);

DUT0: gl1_7ba port map(A => si,B => si1,c1 => '0',S => ot1,c2 => car(0));
DUT1: gl1_7ba port map(A => ot1,B => si2,c1 => car(0),S => ot2,c2 => car(1));
DUT2: gl1_7ba port map(A => ot2,B => si3,c1 => car(1),S => ot,c2 => car(2));
end Behavioral;



