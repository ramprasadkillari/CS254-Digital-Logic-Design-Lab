----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:06 02/13/2019 
-- Design Name: 
-- Module Name:    Even_Parity - Behavioral 
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

entity gl2_evenp is
    Port ( X : in  STD_LOGIC_VECTOR (15 downto 0);
           res : out  STD_LOGIC);
end gl2_evenp;

architecture Behavioral of gl2_evenp is

begin

res <= not(X(0) xor X(1) xor X(2) xor X(3) xor X(4) xor X(5) xor X(6) xor X(7) xor X(8) xor X(9) xor X(10) xor X(11) xor X(12) xor X(13) xor X(14) xor X(15));

end Behavioral;
