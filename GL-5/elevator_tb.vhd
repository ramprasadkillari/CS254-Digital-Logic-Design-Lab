--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:47 03/20/2019
-- Design Name:   
-- Module Name:   /users/ug17/ramprasadk/dld_lab3/Gl4/elevator_tb.vhd
-- Project Name:  Gl4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: module
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
 
ENTITY elevator_tb IS
END elevator_tb;
 
ARCHITECTURE behavior OF elevator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT module
    PORT(
         out_reqtb : IN  std_logic_vector(13 downto 0);
       --  out_reqtest : OUT  std_logic_vector(13 downto 0);
         pres_state : OUT  std_logic_vector(2 downto 0);
         empty : OUT  std_logic;
         stop : OUT  std_logic;
         direc : OUT  std_logic;
         clk : IN  std_logic;
         in_reqtb : IN  std_logic_vector(6 downto 0)
        -- in_reqtest : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal out_reqtb : std_logic_vector(13 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal in_reqtb : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
  -- signal out_reqtest : std_logic_vector(13 downto 0);
   signal pres_state : std_logic_vector(2 downto 0);
   signal empty : std_logic;
   signal stop : std_logic;
   signal direc : std_logic;
   --signal in_reqtest : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: module PORT MAP (
          out_reqtb => out_reqtb,
        --  out_reqtest => out_reqtest,
          pres_state => pres_state,
          empty => empty,
          stop => stop,
          direc => direc,
          clk => clk,
          in_reqtb => in_reqtb
       --   in_reqtest => in_reqtest
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

  --    wait for clk_period*10;
		out_reqtb <= "00001100000000";
		out_reqtb <= "00000000110000";
		out_reqtb <= "00000011001100";
		--out_reqtb <= "00001100000000";
		in_reqtb <= "0000010";
		out_reqtb <= "00000011000000";
		in_reqtb <= "0000001";
--		out_reqtb <= "00001100000000";
--		in_reqtb <= "0000000";

      -- insert stimulus here 

      wait;
   end process;

END;
