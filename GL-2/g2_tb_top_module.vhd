--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:55:48 02/13/2019
-- Design Name:   
-- Module Name:   /home/chinnu/gl2/gl2_top_module_tb.vhd
-- Project Name:  gl2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl2_top_module
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
 
ENTITY gl2_top_module_tb IS

END gl2_top_module_tb;
 
ARCHITECTURE behavior OF gl2_top_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl2_top_module
    PORT(
         x : IN  std_logic_vector(37 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         o1 : OUT  std_logic;
         o2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(37 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal o1 : std_logic;
   signal o2 : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl2_top_module PORT MAP (
          x => x,
          sel => sel,
          o1 => o1,
          o2 => o2
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      x <= "00000000000000000000000000000000000000";
		sel <= "000";
		wait for 1 ns;
		assert(o1='1') report "Fail 0/0" severity error;
		assert(o2="0000") report "Fail 0/0" severity error;
		
		x <= "10000000000000000000000000000000000000";
		sel <= "000";
		wait for 1 ns;
		assert(o1='1') report "Fail 0/0" severity error;
		assert(o2="1111") report "Fail 0/0" severity error;
		
		x <= "01000000000000000000000000000100000001";
		sel <= "000";
		wait for 1 ns;
		assert(o1='1') report "Fail 0/0" severity error;
		assert(o2="1101") report "Fail 0/0" severity error;
		
		x <= "00100000000000000000000000001100000001";
		sel <= "000";
		wait for 1 ns;
		assert(o1='1') report "Fail 0/0" severity error;
		assert(o2="1011") report "Fail 0/0" severity error;
		
		x <= "00111000000000000000000000111100000001";
		sel <= "100";
		wait for 1 ns;
		assert(o1='0') report "Fail 0/0" severity error;
		assert(o2="1011") report "Fail 0/0" severity error;

      wait;
   end process;

END;