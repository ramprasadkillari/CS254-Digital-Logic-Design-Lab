--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:42:06 03/13/2019
-- Design Name:   
-- Module Name:   /home/labuser/stop_watch/stop_watch_tb.vhd
-- Project Name:  stop_watch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stop_watch
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
 
ENTITY stop_watch_tb IS
END stop_watch_tb;
 
ARCHITECTURE behavior OF stop_watch_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stop_watch
    PORT(
         t_start : IN  std_logic;
         t_stop : IN  std_logic;
         t_reset : IN  std_logic;
         clk : IN  std_logic;
         time_ms : OUT  std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal t_start : std_logic := '0';
   signal t_stop : std_logic := '0';
   signal t_reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal time_ms : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stop_watch PORT MAP (
          t_start => t_start,
          t_stop => t_stop,
          t_reset => t_reset,
          clk => clk,
          time_ms => time_ms
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
      --wait for 100 ns;	

			t_start <= '1';
			t_stop <= '0';
			t_reset <= '0';
			wait for 2 ms;
			wait for 200ns;
			assert(time_ms = "00000010") report "2ms/1,0,0" severity error;
			
			t_start <= '0';
			t_stop <= '0';
			t_reset <= '1';
			wait for 2ms;
			
			assert(time_ms = "00000000") report "0ms/0,0,1" severity error;	
--			
			t_start <= '0';
			t_stop <= '0';
			t_reset <= '0';

			wait for 6ms;
			wait for 200ns;
			assert(time_ms = "00000110") report "6ms/0,0,0" severity error;
			
			t_start <= '0';
			t_stop <= '1';
			t_reset <= '0';
			wait for 2ms;
			
			assert(time_ms = "00000110") report "6ms/0,1,0" severity error;
			
			-- clear inputs
			assert false report "Test Done" severity note;
		
      wait;
   end process;

END;