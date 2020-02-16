----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:31 04/03/2019 
-- Design Name: 
-- Module Name:    rrarbiter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    entity rrarbiter is
  --  generic ( CNT : integer := 4 );
    port (
    clk   : in    std_logic;
    rst_n : in    std_logic;
    req   : in    std_logic_vector(3 downto 0);
    ack   : in    std_logic;
    grant : out   std_logic_vector(3 downto 0)
    );
    end;


architecture rrarbiter of rrarbiter is
    
	 signal grant_q  : std_logic_vector(3 downto 0) := (others => '0');
    signal pre_req  : std_logic_vector(3 downto 0) := (others => '0');
    signal sel_gnt  : std_logic_vector(3 downto 0);
    signal isol_lsb : std_logic_vector(3 downto 0);
    signal mask_pre : std_logic_vector(3 downto 0) := (others => '0');
    signal win      : std_logic_vector(3 downto 0);

Begin
	-- req is unmasked 
    grant    <= grant_q;
    mask_pre <= req and not (std_logic_vector(unsigned(pre_req) - 1) or pre_req); -- Mask off previous winners
    sel_gnt  <= mask_pre and std_logic_vector(unsigned(not(mask_pre)) + 1);       -- Select new winner by isolating the lsb of masked vector.
    isol_lsb <= req and std_logic_vector(unsigned(not(req)) + 1);            -- Isolate least significant set bit.
    win      <= sel_gnt when mask_pre /= (3 downto 0 => '0') else isol_lsb;


    process (clk, rst_n, ack)
    begin
   	 if rst_n = '1' then
   		 pre_req <= (others => '0');
   		 grant_q <= (others => '0');

   	 elsif rising_edge(clk) then
   		 grant_q <= grant_q;
   		 pre_req <= pre_req;


   		 if grant_q = (3 downto 0 => '0') or ack = '1' then

   			 if win /= (3 downto 0 => '0') then
    				pre_req <= win;
   			 end if;

    			grant_q <= win;
    		end if;
   	 end if;
    end process;


end rrarbiter;