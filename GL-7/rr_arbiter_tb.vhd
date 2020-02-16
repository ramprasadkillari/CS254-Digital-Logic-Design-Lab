--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:06 04/07/2019
-- Design Name:   
-- Module Name:   /home/ramprasad/dld/Gl6/rr_arbiter_tb.vhd
-- Project Name:  Gl6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rrarbiter
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
 
ENTITY rr_arbiter_tb IS
END rr_arbiter_tb;
 
ARCHITECTURE behavior OF rr_arbiter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rrarbiter
    PORT(
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         req : IN  std_logic_vector(3 downto 0);
         ack : IN  std_logic;
         grant : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst_n : std_logic := '1';
   signal req : std_logic_vector(3 downto 0) := (others => '0');
   signal ack : std_logic := '0';

 	--Outputs
   signal grant : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rrarbiter PORT MAP (
          clk => clk,
          rst_n => rst_n,
          req => req,
          ack => ack,
          grant => grant
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
      wait for 10 ns;	

   --   wait for clk_period*10;

      -- insert stimulus here 
		
		req <= "1010";
		wait for 10 ns;
		req <= "1011";
		wait until rising_edge(clk);
		ack <= '1';
		wait for 30ns;
		ack <= '0';
      wait;
   end process;

END;
