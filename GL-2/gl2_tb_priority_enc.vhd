--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:03 02/13/2019
-- Design Name:   
-- Module Name:   /users/ug17/ramprasadk/dld_lab3/gl2_tb_priority_enc.vhd
-- Project Name:  dld_lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl2_priority_enc
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
 
ENTITY gl2_tb_priority_enc IS
END gl2_tb_priority_enc;
 
ARCHITECTURE behavior OF gl2_tb_priority_enc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl2_priority_enc
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         O_2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal O_2 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl2_priority_enc PORT MAP (
          x => x,
          O_2 => O_2
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;

      -- insert stimulus here 
   process
	begin
	x <= "01001000";
	wait for 1ns;
	assert(O_2 = "1101") report "Fail 01001000/1101" severity error;
	
	x <= "00011000";
	wait for 1ns;
	assert(O_2 = "1001") report "Fail 00011000/1001" severity error;
	
	
	--clear Inputs
	x <= "00000000";
	wait for 1ns;
	assert false report "Test Done" severity note;
      wait;
   end process;

END;
