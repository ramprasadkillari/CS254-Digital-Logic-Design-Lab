--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:15:57 03/06/2019
-- Design Name:   
-- Module Name:   /home/somavaraputarun/Sem4/CS226/gl3/gl3_4ba_tb.vhd
-- Project Name:  gl3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl3_4ba
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
 
ENTITY gl3_4ba_tb IS
END gl3_4ba_tb;
 
ARCHITECTURE behavior OF gl3_4ba_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl3_4ba
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         add : IN  std_logic;
         clk : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         carry : OUT  std_logic;
         valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal add : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal carry : std_logic;
   signal valid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl3_4ba PORT MAP (
          A => A,
          B => B,
          add => add,
          clk => clk,
          sum => sum,
          carry => carry,
          valid => valid
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
		wait for 100ns;
      wait until rising_edge(clk);

      -- insert stimulus here 
		A<="0010";
		B<="0101";
		add<='1';
		wait until rising_edge(clk);
		add<='0';
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0111" and carry='0' and valid='1') report "FAil 0/0" severity error;
		
		wait until rising_edge(clk);
		A<="1111";
		B<="1110";
		add<='1';
		wait until rising_edge(clk);
		add<='0';
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="0000" and carry='0' and valid='0') report "FAil 0/0" severity error;
		wait until rising_edge(clk);
		assert(sum="1101" and carry='1' and valid='1') report "FAil 0/0" severity error;



      wait;
   end process;

END;
