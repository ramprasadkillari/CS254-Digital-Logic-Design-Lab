--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:20 02/06/2019
-- Design Name:   
-- Module Name:   /home/chinnu/glab1/gl1_tb_7bs.vhd
-- Project Name:  glab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl1_7bs
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
 
ENTITY gl1_tb_7bs IS
END gl1_tb_7bs;
 
ARCHITECTURE behavior OF gl1_tb_7bs IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl1_7bs
    PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
        );
    END COMPONENT;
    

signal A_in, B_in, S_out: std_logic_vector(6 downto 0);
signal c2_out: std_logic;

BEGIN
 
	-- Connect DUT
  DUT: gl1_7bs port map(A => A_in,B => B_in, S => S_out, c2 => c2_out);
	process
   begin	
    A_in <= "1111111";
    B_in <= "1111011";
    wait for 1 ns;
    assert(S_out="0000100") report "Fail 0/0" severity error;
    assert(c2_out='0') report "Fail 0/0" severity error;
	 
	  -- Clear inputs
    A_in <= "0000000";
    B_in <= "0000000";

    assert false report "Test done." severity note;

      wait;
   end process;

END;
