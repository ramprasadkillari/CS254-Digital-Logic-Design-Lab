----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:14 04/10/2019 
-- Design Name: 
-- Module Name:    gl1_bcd - Behavioral 
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

entity gl1_bcd is
port(
A:in std_logic_vector(7 downto 0);
B:out std_logic_vector(11 downto 0)
);
end gl1_bcd;

architecture Behavioral of gl1_bcd is

begin
process(A) is
begin
if (A = "00000000") then
    B <= "000000000000" ;
elsif (A = "00000001") then
    B <= "000000000001" ;
elsif (A = "00000010") then
    B <= "000000000010" ;
elsif (A = "00000011") then
    B <= "000000000011" ;
elsif (A = "00000100") then
    B <= "000000000100" ;
elsif (A = "00000101") then
    B <= "000000000101" ;
elsif (A = "00000110") then
    B <= "000000000110" ;
elsif (A = "00000111") then
    B <= "000000000111" ;
elsif (A = "00001000") then
    B <= "000000001000" ;
elsif (A = "00001001") then
    B <= "000000001001" ;
elsif (A = "00001010") then
    B <= "000000010000" ;
elsif (A = "00001011") then
    B <= "000000010001" ;
elsif (A = "00001100") then
    B <= "000000010010" ;
elsif (A = "00001101") then
    B <= "000000010011" ;
elsif (A = "00001110") then
    B <= "000000010100" ;
elsif (A = "00001111") then
    B <= "000000010101" ;
elsif (A = "00010000") then
    B <= "000000010110" ;
elsif (A = "00010001") then
    B <= "000000010111" ;
elsif (A = "00010010") then
    B <= "000000011000" ;
elsif (A = "00010011") then
    B <= "000000011001" ;
elsif (A = "00010100") then
    B <= "000000100000" ;
elsif (A = "00010101") then
    B <= "000000100001" ;
elsif (A = "00010110") then
    B <= "000000100010" ;
elsif (A = "00010111") then
    B <= "000000100011" ;
elsif (A = "00011000") then
    B <= "000000100100" ;
elsif (A = "00011001") then
    B <= "000000100101" ;
elsif (A = "00011010") then
    B <= "000000100110" ;
elsif (A = "00011011") then
    B <= "000000100111" ;
elsif (A = "00011100") then
    B <= "000000101000" ;
elsif (A = "00011101") then
    B <= "000000101001" ;
elsif (A = "00011110") then
    B <= "000000110000" ;
elsif (A = "00011111") then
    B <= "000000110001" ;
elsif (A = "00100000") then
    B <= "000000110010" ;
elsif (A = "00100001") then
    B <= "000000110011" ;
elsif (A = "00100010") then
    B <= "000000110100" ;
elsif (A = "00100011") then
    B <= "000000110101" ;
elsif (A = "00100100") then
    B <= "000000110110" ;
elsif (A = "00100101") then
    B <= "000000110111" ;
elsif (A = "00100110") then
    B <= "000000111000" ;
elsif (A = "00100111") then
    B <= "000000111001" ;
elsif (A = "00101000") then
    B <= "000001000000" ;
elsif (A = "00101001") then
    B <= "000001000001" ;
elsif (A = "00101010") then
    B <= "000001000010" ;
elsif (A = "00101011") then
    B <= "000001000011" ;
elsif (A = "00101100") then
    B <= "000001000100" ;
elsif (A = "00101101") then
    B <= "000001000101" ;
elsif (A = "00101110") then
    B <= "000001000110" ;
elsif (A = "00101111") then
    B <= "000001000111" ;
elsif (A = "00110000") then
    B <= "000001001000" ;
elsif (A = "00110001") then
    B <= "000001001001" ;
elsif (A = "00110010") then
    B <= "000001010000" ;
elsif (A = "00110011") then
    B <= "000001010001" ;
elsif (A = "00110100") then
    B <= "000001010010" ;
elsif (A = "00110101") then
    B <= "000001010011" ;
elsif (A = "00110110") then
    B <= "000001010100" ;
elsif (A = "00110111") then
    B <= "000001010101" ;
elsif (A = "00111000") then
    B <= "000001010110" ;
elsif (A = "00111001") then
    B <= "000001010111" ;
elsif (A = "00111010") then
    B <= "000001011000" ;
elsif (A = "00111011") then
    B <= "000001011001" ;
elsif (A = "00111100") then
    B <= "000001100000" ;
elsif (A = "00111101") then
    B <= "000001100001" ;
elsif (A = "00111110") then
    B <= "000001100010" ;
elsif (A = "00111111") then
    B <= "000001100011" ;
elsif (A = "01000000") then
    B <= "000001100100" ;
elsif (A = "01000001") then
    B <= "000001100101" ;
elsif (A = "01000010") then
    B <= "000001100110" ;
elsif (A = "01000011") then
    B <= "000001100111" ;
elsif (A = "01000100") then
    B <= "000001101000" ;
elsif (A = "01000101") then
    B <= "000001101001" ;
elsif (A = "01000110") then
    B <= "000001110000" ;
elsif (A = "01000111") then
    B <= "000001110001" ;
elsif (A = "01001000") then
    B <= "000001110010" ;
elsif (A = "01001001") then
    B <= "000001110011" ;
elsif (A = "01001010") then
    B <= "000001110100" ;
elsif (A = "01001011") then
    B <= "000001110101" ;
elsif (A = "01001100") then
    B <= "000001110110" ;
elsif (A = "01001101") then
    B <= "000001110111" ;
elsif (A = "01001110") then
    B <= "000001111000" ;
elsif (A = "01001111") then
    B <= "000001111001" ;
elsif (A = "01010000") then
    B <= "000010000000" ;
elsif (A = "01010001") then
    B <= "000010000001" ;
elsif (A = "01010010") then
    B <= "000010000010" ;
elsif (A = "01010011") then
    B <= "000010000011" ;
elsif (A = "01010100") then
    B <= "000010000100" ;
elsif (A = "01010101") then
    B <= "000010000101" ;
elsif (A = "01010110") then
    B <= "000010000110" ;
elsif (A = "01010111") then
    B <= "000010000111" ;
elsif (A = "01011000") then
    B <= "000010001000" ;
elsif (A = "01011001") then
    B <= "000010001001" ;
elsif (A = "01011010") then
    B <= "000010010000" ;
elsif (A = "01011011") then
    B <= "000010010001" ;
elsif (A = "01011100") then
    B <= "000010010010" ;
elsif (A = "01011101") then
    B <= "000010010011" ;
elsif (A = "01011110") then
    B <= "000010010100" ;
elsif (A = "01011111") then
    B <= "000010010101" ;
elsif (A = "01100000") then
    B <= "000010010110" ;
elsif (A = "01100001") then
    B <= "000010010111" ;
elsif (A = "01100010") then
    B <= "000010011000" ;
elsif (A = "01100011") then
    B <= "000010011001" ;
elsif (A = "01100100") then
    B <= "000100000000" ;
elsif (A = "01100101") then
    B <= "000100000001" ;
elsif (A = "01100110") then
    B <= "000100000010" ;
elsif (A = "01100111") then
    B <= "000100000011" ;
elsif (A = "01101000") then
    B <= "000100000100" ;
elsif (A = "01101001") then
    B <= "000100000101" ;
elsif (A = "01101010") then
    B <= "000100000110" ;
elsif (A = "01101011") then
    B <= "000100000111" ;
elsif (A = "01101100") then
    B <= "000100001000" ;
elsif (A = "01101101") then
    B <= "000100001001" ;
elsif (A = "01101110") then
    B <= "000100010000" ;
elsif (A = "01101111") then
    B <= "000100010001" ;
elsif (A = "01110000") then
    B <= "000100010010" ;
elsif (A = "01110001") then
    B <= "000100010011" ;
elsif (A = "01110010") then
    B <= "000100010100" ;
elsif (A = "01110011") then
    B <= "000100010101" ;
elsif (A = "01110100") then
    B <= "000100010110" ;
elsif (A = "01110101") then
    B <= "000100010111" ;
elsif (A = "01110110") then
    B <= "000100011000" ;
elsif (A = "01110111") then
    B <= "000100011001" ;
elsif (A = "01111000") then
    B <= "000100100000" ;
elsif (A = "01111001") then
    B <= "000100100001" ;
elsif (A = "01111010") then
    B <= "000100100010" ;
elsif (A = "01111011") then
    B <= "000100100011" ;
elsif (A = "01111100") then
    B <= "000100100100" ;
elsif (A = "01111101") then
    B <= "000100100101" ;
elsif (A = "01111110") then
    B <= "000100100110" ;
elsif (A = "01111111") then
    B <= "000100100111" ;
elsif (A = "10000000") then
    B <= "000100101000" ;
elsif (A = "10000001") then
    B <= "000100101001" ;
elsif (A = "10000010") then
    B <= "000100110000" ;
elsif (A = "10000011") then
    B <= "000100110001" ;
elsif (A = "10000100") then
    B <= "000100110010" ;
elsif (A = "10000101") then
    B <= "000100110011" ;
elsif (A = "10000110") then
    B <= "000100110100" ;
elsif (A = "10000111") then
    B <= "000100110101" ;
elsif (A = "10001000") then
    B <= "000100110110" ;
elsif (A = "10001001") then
    B <= "000100110111" ;
elsif (A = "10001010") then
    B <= "000100111000" ;
elsif (A = "10001011") then
    B <= "000100111001" ;
elsif (A = "10001100") then
    B <= "000101000000" ;
elsif (A = "10001101") then
    B <= "000101000001" ;
elsif (A = "10001110") then
    B <= "000101000010" ;
elsif (A = "10001111") then
    B <= "000101000011" ;
elsif (A = "10010000") then
    B <= "000101000100" ;
elsif (A = "10010001") then
    B <= "000101000101" ;
elsif (A = "10010010") then
    B <= "000101000110" ;
elsif (A = "10010011") then
    B <= "000101000111" ;
elsif (A = "10010100") then
    B <= "000101001000" ;
elsif (A = "10010101") then
    B <= "000101001001" ;
elsif (A = "10010110") then
    B <= "000101010000" ;
elsif (A = "10010111") then
    B <= "000101010001" ;
elsif (A = "10011000") then
    B <= "000101010010" ;
elsif (A = "10011001") then
    B <= "000101010011" ;
elsif (A = "10011010") then
    B <= "000101010100" ;
elsif (A = "10011011") then
    B <= "000101010101" ;
elsif (A = "10011100") then
    B <= "000101010110" ;
elsif (A = "10011101") then
    B <= "000101010111" ;
elsif (A = "10011110") then
    B <= "000101011000" ;
elsif (A = "10011111") then
    B <= "000101011001" ;
elsif (A = "10100000") then
    B <= "000101100000" ;
elsif (A = "10100001") then
    B <= "000101100001" ;
elsif (A = "10100010") then
    B <= "000101100010" ;
elsif (A = "10100011") then
    B <= "000101100011" ;
elsif (A = "10100100") then
    B <= "000101100100" ;
elsif (A = "10100101") then
    B <= "000101100101" ;
elsif (A = "10100110") then
    B <= "000101100110" ;
elsif (A = "10100111") then
    B <= "000101100111" ;
elsif (A = "10101000") then
    B <= "000101101000" ;
elsif (A = "10101001") then
    B <= "000101101001" ;
elsif (A = "10101010") then
    B <= "000101110000" ;
elsif (A = "10101011") then
    B <= "000101110001" ;
elsif (A = "10101100") then
    B <= "000101110010" ;
elsif (A = "10101101") then
    B <= "000101110011" ;
elsif (A = "10101110") then
    B <= "000101110100" ;
elsif (A = "10101111") then
    B <= "000101110101" ;
elsif (A = "10110000") then
    B <= "000101110110" ;
elsif (A = "10110001") then
    B <= "000101110111" ;
elsif (A = "10110010") then
    B <= "000101111000" ;
elsif (A = "10110011") then
    B <= "000101111001" ;
elsif (A = "10110100") then
    B <= "000110000000" ;
elsif (A = "10110101") then
    B <= "000110000001" ;
elsif (A = "10110110") then
    B <= "000110000010" ;
elsif (A = "10110111") then
    B <= "000110000011" ;
elsif (A = "10111000") then
    B <= "000110000100" ;
elsif (A = "10111001") then
    B <= "000110000101" ;
elsif (A = "10111010") then
    B <= "000110000110" ;
elsif (A = "10111011") then
    B <= "000110000111" ;
elsif (A = "10111100") then
    B <= "000110001000" ;
elsif (A = "10111101") then
    B <= "000110001001" ;
elsif (A = "10111110") then
    B <= "000110010000" ;
elsif (A = "10111111") then
    B <= "000110010001" ;
elsif (A = "11000000") then
    B <= "000110010010" ;
elsif (A = "11000001") then
    B <= "000110010011" ;
elsif (A = "11000010") then
    B <= "000110010100" ;
elsif (A = "11000011") then
    B <= "000110010101" ;
elsif (A = "11000100") then
    B <= "000110010110" ;
elsif (A = "11000101") then
    B <= "000110010111" ;
elsif (A = "11000110") then
    B <= "000110011000" ;
end if;
end process;
end Behavioral;

