--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:12 03/23/2019
-- Design Name:   
-- Module Name:   /home/ramprasad/elevator/seq_det_tb.vhd
-- Project Name:  elevator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seq_det
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
 
ENTITY seq_det_tb IS
END seq_det_tb;
 
ARCHITECTURE behavior OF seq_det_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seq_det
    PORT(
         seq : IN  std_logic_vector(1071 downto 0);
         clk : IN  std_logic;
         det : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal seq : std_logic_vector(1071 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal det : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seq_det PORT MAP (
          seq => seq,
          clk => clk,
          det => det
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    --  wait for 100 ns;	
	-- wait until rising_edge(clk);
	 seq <= "0000100011110010010100110010001010001111100100001011001010101100011001100110101010101111001001010011010100110000010000100111010101000010001010101101010101011110010010100111011101010101111001001010011000010001110001100001110110111111101011000000110011101100001010100110100111010101111101111000000110010110110010001010000110111101001011000100011011010101011000100010010101111100111001101100011010001100010111001111111001011011101000101101110010100110110011110100010101000011001011101111110101001101000000011111110101101010001011110001100111110101000101110101111110001111010000011111101010110010110111110010010110111110110001111010101000001111101101110000001110101000111111111000100110000001101000100111111100010101010011000010111110001100101110100100100110010001010000000010110011101111101000100111100011011000011001101110101110100001101000011101111000010100001000101011101010110001111101110101001000110101000101111100110110011001011101110111100011111010111101100000000111111000111110011001111010010101000001110101110110000110101100011100101000101111010010101111111000111000";
       wait until rising_edge(clk);
		 
		wait for clk_period*99;
		wait for 2 ns;
		assert(det = '1') report "fail 1" severity error;
		
		wait for clk_period*71;
		--wait for 2 ns;
		assert(det = '1') report "fail 2" severity error;
		
		wait for clk_period*28;
--		wait for 2 ns;
		assert(det = '1') report "fail 3" severity error;
      -- insert stimulus here 

      wait;
   end process;

END;
