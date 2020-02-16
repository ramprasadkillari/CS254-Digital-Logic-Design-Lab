----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:07:01 02/13/2019 
-- Design Name: 
-- Module Name:    Comp_16 - Behavioral 
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

entity gl2_comparator is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           cl : out  STD_LOGIC;
           cg : out  STD_LOGIC;
           ce : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

signal X : std_logic_vector(15 downto 0);
begin
process(A,B,X) is
begin
X(0) <= (A(0) and B(0)) or (not(A(0)) and not(B(0)));
X(1) <= (A(1) and B(1)) or (not(A(1)) and not(B(1)));
X(2) <= (A(2) and B(2)) or (not(A(2)) and not(B(2)));
X(3) <= (A(3) and B(3)) or (not(A(3)) and not(B(3)));
X(4) <= (A(4) and B(4)) or (not(A(4)) and not(B(4)));
X(5) <= (A(5) and B(5)) or (not(A(5)) and not(B(5)));
X(6) <= (A(6) and B(6)) or (not(A(6)) and not(B(6)));
X(7) <= (A(7) and B(7)) or (not(A(7)) and not(B(7)));
X(8) <= (A(8) and B(8)) or (not(A(8)) and not(B(8)));
X(9) <= (A(9) and B(9)) or (not(A(9)) and not(B(9)));
X(10) <= (A(10) and B(10)) or (not(A(10)) and not(B(10)));
X(11) <= (A(11) and B(11)) or (not(A(11)) and not(B(11)));
X(12) <= (A(12) and B(12)) or (not(A(12)) and not(B(12)));
X(13) <= (A(13) and B(13)) or (not(A(13)) and not(B(13)));
X(14) <= (A(14) and B(14)) or (not(A(14)) and not(B(14)));
X(15) <= (A(15) and B(15)) or (not(A(15)) and not(B(15)));

ce <= X(0) and X(1) and X(2) and X(3) and X(4) and X(5) and X(6) and X(7) and X(8) and X(9) and X(10) and X(11) and X(12) and X(13) and X(14) and X(15);

cg <= (A(15) and not(B(15))) or 
(A(14) and not(B(14)) and X(15)) or
(A(13) and not(B(13)) and X(15) and X(14)) or 
(A(12) and not(B(12)) and X(15) and X(14) and X(13))or 
(A(11) and not(B(11)) and X(15) and X(14) and X(13) and X(12)) or
(A(10) and not(B(10)) and X(15) and X(14) and X(13) and X(12) and X(11)) or 
(A(9) and not(B(9)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10))or 
(A(8) and not(B(8)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9)) or
(A(7) and not(B(7)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8)) or 
(A(6) and not(B(6)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7))or 
(A(5) and not(B(5)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6)) or
(A(4) and not(B(4)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5)) or 
(A(3) and not(B(3)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4))or 
(A(2) and not(B(2)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3)) or
(A(1) and not(B(1)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2)) or 
(A(0) and not(B(0)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1));

cl <= (B(15) and not(A(15))) or 
(B(14) and not(A(14)) and X(15)) or
(B(13) and not(A(13)) and X(15) and X(14)) or 
(B(12) and not(A(12)) and X(15) and X(14) and X(13))or 
(B(11) and not(A(11)) and X(15) and X(14) and X(13) and X(12)) or
(B(10) and not(A(10)) and X(15) and X(14) and X(13) and X(12) and X(11)) or 
(B(9) and not(A(9)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10))or 
(B(8) and not(A(8)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9)) or
(B(7) and not(A(7)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8)) or 
(B(6) and not(A(6)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7))or 
(B(5) and not(A(5)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6)) or
(B(4) and not(A(4)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5)) or 
(B(3) and not(A(3)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4))or 
(B(2) and not(A(2)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3)) or
(B(1) and not(A(1)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2)) or 
(B(0) and not(A(0)) and X(15) and X(14) and X(13) and X(12) and X(11) and X(10) and X(9) and X(8) and X(7) and X(6) and X(5) and X(4) and X(3) and X(2) and X(1));
end process;
end Behavioral;
