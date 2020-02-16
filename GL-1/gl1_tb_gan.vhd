-- Company: 
-- Engineer:
--
-- Create Date:   17:18:18 02/06/2019
-- Design Name:   
-- Module Name:   /home/chinnu/glab1/gl1_tb_gan.vhd
-- Project Name:  glab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl1_gan
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY gl1_tb_gan IS
END gl1_tb_gan;
 
ARCHITECTURE behavior OF gl1_tb_gan IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl1_gan
    PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         C : OUT  std_logic_vector(7 downto 0);
			BCD: OUT std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(6 downto 0) := (others => '0');
   signal B : std_logic_vector(6 downto 0) := (others => '0');
	signal BCD : std_logic_vector(11 downto 0);
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';
	

 	--Outputs
   signal C : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl1_gan PORT MAP (
          A => A,
          B => B,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          C => C,
			 BCD => BCD
        );
    process
	 begin
    A <= "0001011";
    B <= "1100011";
    S1 <= '0';
	 S2 <= '0';
    wait for 1 ns;
    assert(C="01101110" and BCD="000100010000") report "Fail 0/0" severity error;

    A <= "0000111";
    B <= "0001001";
    S1 <= '1';
	 S2 <= '0';
    wait for 1 ns;
    assert(C="00111111" and BCD="000001100011") report "Fail 1/0" severity error;
	 
	 A <= "1000000";
    B <= "0111111";
    S1 <= '0';
	 S2 <= '1';
    wait for 1 ns;
    assert(C="00000001" and BCD="000000000001") report "Fail 0/1" severity error;
	 
	 A <= "0000111";
    B <= "0000111";
    S1 <= '1';
	 S2 <= '1';
    wait for 1 ns;
    assert(C="00110001" and BCD="000001001001") report "Fail 1/1" severity error;

      -- Clear inputs
    A <= "0000000";
    B <= "0000000";

    assert false report "Test done." severity note;
    wait;
		

   end process;

END;

