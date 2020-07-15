--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:31:29 05/04/2019
-- Design Name:   
-- Module Name:   /home/ramprasad/dld/Project/write_orig_tb.vhd
-- Project Name:  Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: write_orig
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
 
ENTITY write_orig_tb IS
END write_orig_tb;
 
ARCHITECTURE behavior OF write_orig_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT write_orig
    PORT(
         iData_av : IN  std_logic;
         Wr_complete : IN  std_logic;
         Ack_sent : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         Input_port : IN  std_logic_vector(4 downto 0);
         iData : IN  std_logic_vector(143 downto 0);
         opcode : IN  std_logic_vector(2 downto 0);
         iRd_Data : OUT  std_logic;
         Rd_opcode : OUT  std_logic;
         Wr_valid : OUT  std_logic;
         Send_wr_ack : OUT  std_logic;
         Write_Data : OUT  std_logic_vector(511 downto 0);
         Table_number : OUT  std_logic_vector(7 downto 0);
         Table_address : OUT  std_logic_vector(15 downto 0);
         Sequence_number : OUT  std_logic_vector(15 downto 0);
         Output_port : OUT  std_logic_vector(4 downto 0)
	--		stat				  : out std_logic_vector(3 downto 0)			
        );
    END COMPONENT;
    

   --Inputs
   signal iData_av : std_logic := '0';
   signal Wr_complete : std_logic := '1';
   signal Ack_sent : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Input_port : std_logic_vector(4 downto 0) := (others => '0');
   signal iData : std_logic_vector(143 downto 0) := (others => '0');
   signal opcode : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal iRd_Data : std_logic;
   signal Rd_opcode : std_logic;
   signal Wr_valid : std_logic;
   signal Send_wr_ack : std_logic;
   signal Write_Data : std_logic_vector(511 downto 0);
   signal Table_number : std_logic_vector(7 downto 0);
   signal Table_address : std_logic_vector(15 downto 0);
   signal Sequence_number : std_logic_vector(15 downto 0);
   signal Output_port : std_logic_vector(4 downto 0);
--	signal stat			 : std_logic_vector(3 downto 0);	

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: write_orig PORT MAP (
          iData_av => iData_av,
          Wr_complete => Wr_complete,
          Ack_sent => Ack_sent,
          clk => clk,
          rst => rst,
          Input_port => Input_port,
          iData => iData,
          opcode => opcode,
          iRd_Data => iRd_Data,
          Rd_opcode => Rd_opcode,
          Wr_valid => Wr_valid,
          Send_wr_ack => Send_wr_ack,
          Write_Data => Write_Data,
          Table_number => Table_number,
          Table_address => Table_address,
          Sequence_number => Sequence_number,
          Output_port => Output_port
--			 stat	=> stat
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

      wait for clk_period;
		wait until rising_edge(clk);
		opcode <= "001";
		Wr_complete <= '0';
		wait for clk_period;
		opcode <= "011";
		Input_port <= "01010";
		wait for clk_period;
		iData_av <= '1';
		wait for clk_period;
--		rst <= '1';
		iData <= "111100010101010100100111100110000101101011000101000100101101111110111011110001101100011001111100010100001011110101000110010011100010101110100000";
		
--		wait for clk_period;
--		iData <= "100000001101011001111010010101111100110000101101100010111101100100001111110101011110111010101011011101011011101010000100100110110110111101000101";		
--		wait for clk_period;
--		iData <= "100000001101011001111010010101111100110000101101100010111101100100001111110101011110111010101011011101011011101010000100100110110110111101000101";
--		
--		wait for clk_period;
--		rst <= '0';
--		iData <= "100000001101011001111010010101111100110000101101100010111101100100001111110101011110111010101011011101011011101010000100100110110110111101000101";		
--		
		wait for clk_period;
		iData <= '1' & "11111111" & '1' & "01010101" & "111010011110001011110111010111001111100101001101000010110100001100011101110010111110100100100000101101111011111010001111001000";
		wait for clk_period;
		iData <= "100000001101011001111010010101111100110000101101100010111101100100001111110101011110111010101011011101011011101010000100100110110110111101000101";
		wait for clk_period;
		iData <= "111001001111001111110011000101101111111111011111011001100100001101000100101010000110011101110010000111011101111110111110100011111010101101101111";
		wait for clk_period;
		iData <= "100101110110010011110110100101101110101000010100110101110101111101000110111110011111111010101111101100001011101001001100101111111111100110111101";
		-- Table Number 1 and table address 0000010100001101
		wait for clk_period;
		opcode <= "001";                       --          ''''''''                     '''''''' ''''''''                   
		iData <= "1000011111100011111000010111010010111" & "00000001" & "1000011011" & "01111111" & '1' & "11101101" & '1' & "00000001111100111100000001100000001100000001100000001100000001100000001";
		wait for clk_period;
		iData <= "101100011100010110100100001100011001101011001111001010101101111111101001100111001101100011101100110110100100101010100111010001110011110110000100";
		
		wait for clk_period;
		iData <= "110101101101010100111111010101111100101100011110010111111111111111110111111110001110011010110101100110000011100001110110111011100010000101001000";
	
		wait for clk_period;
		iData <= "100101011110110100100100110111111111110110001100101001100001111110100100101010001101000111100001010111101101101011010110001001111100111110101110";
	--	assert(Table_number = "00000010") report "fail Table number" severity  error;
	--	assert(Table_address = "0111111111101101") report "fail Table address" severity  error;
		--assert(Write_Data = "")			
		wait for clk_period*5;
		Wr_complete <= '1';
		iData <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	
		wait for clk_period*4;
		Wr_complete <= '0';
	--	assert(Sequence_number = "1111111101010101") report "fail Sequence_number" severity  error;	
	--	assert(Send_wr_ack = '1') report "fail Send_wr_ack 1" severity  error;	
	--	assert(Output_port = "01010") report "fail Output_port" severity  error;		
		Ack_sent <= '1';
		iData <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

		wait for clk_period;
	--	assert(Send_wr_ack = '0') report "fail Send_wr_ack 0" severity  error;			
		iData <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";		
		assert false report "Test Done. " severity note;
		wait;
   end process;

END;
