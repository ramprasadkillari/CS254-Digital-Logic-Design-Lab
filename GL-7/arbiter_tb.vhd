--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:41:24 04/03/2019
-- Design Name:   
-- Module Name:   /home/somavaraputarun/Sem4/CS226/gl7/arbiter_tb.vhd
-- Project Name:  gl7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arbiter
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
 
ENTITY arbiter_tb IS
END arbiter_tb;
 
ARCHITECTURE behavior OF arbiter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arbiter
    PORT(
         data0 : IN  std_logic_vector(3 downto 0);
         data1 : IN  std_logic_vector(3 downto 0);
         data2 : IN  std_logic_vector(3 downto 0);
         data3 : IN  std_logic_vector(3 downto 0);
         datav0 : IN  std_logic;
         datav1 : IN  std_logic;
         datav2 : IN  std_logic;
         datav3 : IN  std_logic;
         wr_clk0 : IN  std_logic;
         wr_clk1 : IN  std_logic;
         wr_clk2 : IN  std_logic;
         wr_clk3 : IN  std_logic;
         rd_clk : IN  std_logic;
         rst : IN  std_logic;
         data_out : OUT  std_logic_vector(3 downto 0);
         data_v_out : OUT  std_logic;
			grant_t : OUT  std_logic_vector(3 downto 0);
			req_t : OUT  std_logic_vector(3 downto 0);
			ack_t : OUT  std_logic;
			rd_t : out STD_LOGIC_VECTOR (3 downto 0);
			  wr_t : out STD_LOGIC_VECTOR (3 downto 0);
			  emp_t : out STD_LOGIC_VECTOR (3 downto 0);
			  data_out_t : out STD_LOGIC_VECTOR (19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data0 : std_logic_vector(3 downto 0) := (others => '0');
   signal data1 : std_logic_vector(3 downto 0) := (others => '0');
   signal data2 : std_logic_vector(3 downto 0) := (others => '0');
   signal data3 : std_logic_vector(3 downto 0) := (others => '0');
   signal datav0 : std_logic := '0';
   signal datav1 : std_logic := '0';
   signal datav2 : std_logic := '0';
   signal datav3 : std_logic := '0';
   signal wr_clk0 : std_logic := '0';
   signal wr_clk1 : std_logic := '0';
   signal wr_clk2 : std_logic := '0';
   signal wr_clk3 : std_logic := '0';
   signal rd_clk : std_logic := '0';
   signal rst : std_logic := '0';
	signal grant_t : std_logic_vector(3 downto 0) := (others => '0');
	signal req_t : std_logic_vector(3 downto 0) := (others => '0');
	signal ack_t : std_logic;
	signal rd_t : STD_LOGIC_VECTOR (3 downto 0);
	signal wr_t : STD_LOGIC_VECTOR (3 downto 0);
	signal emp_t : STD_LOGIC_VECTOR (3 downto 0);
	signal data_out_t : STD_LOGIC_VECTOR (19 downto 0);

 	--Outputs
   signal data_out : std_logic_vector(3 downto 0);
   signal data_v_out : std_logic;
	

   -- Clock period definitions
   constant rd_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arbiter PORT MAP (
          data0 => data0,
          data1 => data1,
          data2 => data2,
          data3 => data3,
          datav0 => datav0,
          datav1 => datav1,
          datav2 => datav2,
          datav3 => datav3,
          wr_clk0 => wr_clk0,
          wr_clk1 => wr_clk1,
          wr_clk2 => wr_clk2,
          wr_clk3 => wr_clk3,
          rd_clk => rd_clk,
          rst => rst,
          data_out => data_out,
          data_v_out => data_v_out,
			 grant_t => grant_t,
			 req_t => req_t,
			 ack_t => ack_t,
			 rd_t => rd_t,
			 wr_t => wr_t,
			 emp_t => emp_t,
			 data_out_t => data_out_t
        );

   -- Clock process definitions
   rd_clk_process :process
   begin
		rd_clk <= '0';
		wr_clk0 <= '0';
		wr_clk1 <= '0';
		wr_clk2 <= '0';
		wr_clk3 <= '0';
		wait for rd_clk_period/2;
		rd_clk <= '1';
		wr_clk0 <= '1';
		wr_clk1 <= '1';
		wr_clk2 <= '1';
		wr_clk3 <= '1';
		wait for rd_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   --   wait for 10 ns;	

--      wait for rd_clk_period*10;

      -- insert stimulus here
			 data0 <= "0001";
          data1 <= "0010";
          data2 <= "0100";
          data3 <= "1000";
          datav0 <= '1';
          datav1 <= '0';
          datav2 <= '1';
          datav3 <= '0';
			 
			 wait for 20 ns;
			 
			 data0 <= "0011";
          data1 <= "0110";
          data2 <= "1100";
          data3 <= "1001";
          datav0 <= '0';
          datav1 <= '0';
			 wait for 10ns;
          datav2 <= '0';
          datav3 <= '0';
			 
          

      wait;
   end process;

END;
