--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:26:10 04/16/2019
-- Design Name:   
-- Module Name:   /home/ramprasad/dld/Gl6/gl8_trafficlight_tb.vhd
-- Project Name:  Gl6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gl8_trafficlight
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
 
ENTITY gl8_trafficlight_tb IS
END gl8_trafficlight_tb;
 
ARCHITECTURE behavior OF gl8_trafficlight_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gl8_trafficlight
    PORT(
         Q_A : IN  std_logic_vector(2 downto 0);
         Q_B : IN  std_logic_vector(2 downto 0);
         Q_C : IN  std_logic_vector(2 downto 0);
         Q_D : IN  std_logic_vector(2 downto 0);
         Q_E : IN  std_logic_vector(2 downto 0);
         Q_H : IN  std_logic_vector(2 downto 0);
         Q_A1 : IN  std_logic_vector(2 downto 0);
         Q_B1 : IN  std_logic_vector(2 downto 0);
         S_A : IN  std_logic;
         S_B : IN  std_logic;
         S_C : IN  std_logic;
         S_D : IN  std_logic;
         S_E : IN  std_logic;
         S_H : IN  std_logic;
         S_A1 : IN  std_logic;
         S_B1 : IN  std_logic;
         clk : IN  std_logic;
         light_ajbkcj_mg : OUT  std_logic_vector(2 downto 0);
         light_cfdf_mg : OUT  std_logic_vector(2 downto 0);
         light_dkej_mg : OUT  std_logic_vector(2 downto 0);
         light_ck_mg : OUT  std_logic_vector(2 downto 0);
         light_aj_pw : OUT  std_logic_vector(2 downto 0);
         light_bg_pw : OUT  std_logic_vector(2 downto 0);
         light_hk_pw : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Q_A : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_B : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_C : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_D : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_E : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_H : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_A1 : std_logic_vector(2 downto 0) := (others => '0');
   signal Q_B1 : std_logic_vector(2 downto 0) := (others => '0');
   signal S_A : std_logic := '0';
   signal S_B : std_logic := '0';
   signal S_C : std_logic := '0';
   signal S_D : std_logic := '0';
   signal S_E : std_logic := '0';
   signal S_H : std_logic := '0';
   signal S_A1 : std_logic := '0';
   signal S_B1 : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal light_ajbkcj_mg : std_logic_vector(2 downto 0);
   signal light_cfdf_mg : std_logic_vector(2 downto 0);
   signal light_dkej_mg : std_logic_vector(2 downto 0);
   signal light_ck_mg : std_logic_vector(2 downto 0);
   signal light_aj_pw : std_logic_vector(2 downto 0);
   signal light_bg_pw : std_logic_vector(2 downto 0);
   signal light_hk_pw : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gl8_trafficlight PORT MAP (
          Q_A => Q_A,
          Q_B => Q_B,
          Q_C => Q_C,
          Q_D => Q_D,
          Q_E => Q_E,
          Q_H => Q_H,
          Q_A1 => Q_A1,
          Q_B1 => Q_B1,
          S_A => S_A,
          S_B => S_B,
          S_C => S_C,
          S_D => S_D,
          S_E => S_E,
          S_H => S_H,
          S_A1 => S_A1,
          S_B1 => S_B1,
          clk => clk,
          light_ajbkcj_mg => light_ajbkcj_mg,
          light_cfdf_mg => light_cfdf_mg,
          light_dkej_mg => light_dkej_mg,
          light_ck_mg => light_ck_mg,
          light_aj_pw => light_aj_pw,
          light_bg_pw => light_bg_pw,
          light_hk_pw => light_hk_pw
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
