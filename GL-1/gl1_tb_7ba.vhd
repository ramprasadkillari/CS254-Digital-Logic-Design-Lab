--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:31:16 02/06/2019
-- Design Name:   
-- Module Name:   /home/chinnu/glab1/gl1_tb_7ba.vhd
-- Project Name:  glab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl1_7ba
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
 
ENTITY gl1_tb_7ba IS
END gl1_tb_7ba;
 
ARCHITECTURE behavior OF gl1_tb_7ba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl1_7ba
    PORT(
         A : IN  std_logic_vector(6 downto 0);
         B : IN  std_logic_vector(6 downto 0);
         c1 : IN  std_logic;
         S : OUT  std_logic_vector(6 downto 0);
         c2 : OUT  std_logic
        );
    END COMPONENT;
	 
signal A_in, B_in, S_out: std_logic_vector(6 downto 0);
signal c1_in, c2_out: std_logic;

begin

  -- Connect DUT
  DUT: gl1_7ba port map(A => A_in,B => B_in, c1 => c1_in, S => S_out, c2 => c2_out);
	process
   begin		
     
	   A_in <= "1111011";
    B_in <= "1111010";
    c1_in <= '0';
    wait for 1 ns;
    assert(S_out="1110101") report "Fail 0/0" severity error;
    assert(c2_out='1') report "Fail 0/0" severity error;
    
    
    
    -- Clear inputs
    A_in <= "0000000";
    B_in <= "0000000";

    assert false report "Test done." severity note;
    wait;
   end process;

END;
