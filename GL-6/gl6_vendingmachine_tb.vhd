--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:16 03/27/2019
-- Design Name:   
-- Module Name:   /home/chinnu/gl6/gl6_vendingmachine_tb.vhd
-- Project Name:  gl6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl6_vendingmachine
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
 
ENTITY gl6_vendingmachine_tb IS
END gl6_vendingmachine_tb;
 
ARCHITECTURE behavior OF gl6_vendingmachine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl6_vendingmachine
    PORT(
         item_in : IN  std_logic_vector(2 downto 0);
         clk : IN  std_logic;
         money_in : IN  std_logic_vector(3 downto 0);
         money_out : OUT  std_logic;
         item_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal item_in : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal money_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
	 signal money_out : std_logic := '0';
   signal item_out : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl6_vendingmachine PORT MAP (
          item_in => item_in,
          clk => clk,
          money_in => money_in,
          money_out => money_out,
          item_out => item_out
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
      wait until rising_edge(clk);	
		item_in <= "010"; -- sam 10rs
		wait until rising_edge(clk);	
		money_in <= "1000"; -- 5rs
		wait until rising_edge(clk);	
		money_in <= "0100"; -- 50rs
		
      wait for clk_period*11;
		
		wait until rising_edge(clk);	
		item_in <= "100"; -- upma 30rs
		wait until rising_edge(clk);	
		money_in <= "1000"; --5rs
		wait until rising_edge(clk);	
		money_in <= "0111"; --10rs
		wait until rising_edge(clk);	
		money_in <= "0100"; --50rs
		
		wait for clk_period*9;
		
		-- clear inputs
		item_in <= "000";
		money_in <= "0000";
      -- insert stimulus here 

      wait;
   end process;

END;
