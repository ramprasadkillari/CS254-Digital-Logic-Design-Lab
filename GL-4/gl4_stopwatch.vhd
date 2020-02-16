----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:11 03/13/2019 
-- Design Name: 
-- Module Name:    stop_watch - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stop_watch is
    Port ( t_start : in  STD_LOGIC;
           t_stop : in  STD_LOGIC;
           t_reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           time_ms : out  STD_LOGIC_VECTOR (7 downto 0));
end stop_watch;

architecture Behavioral of stop_watch is

type states is (IDLE,START,STOP);
signal p_state,n_state: states:= IDLE;
signal l_count : std_logic_vector(7 downto 0):= "00000000";
signal cnt : std_logic_vector(16 downto 0):="00000000000000000";
signal msec,dup_reset: std_logic:= '0';

begin

process(clk)
begin
	if rising_edge(clk) then
		p_state <= n_state;
	end if;
end process;	

process(p_state,t_start,t_stop,t_reset)
begin
   case p_state is
	   when IDLE =>
		   if t_start = '1' then
			   n_state <= START;
			else
				n_state <= IDLE;
			end if;
		when START =>
			if t_stop = '1' then
				n_state <= STOP;
			else
				n_state <= START;
			end if;
		when STOP =>
			if t_start = '1' then
				n_state <= START;
			elsif t_reset = '1' then
				n_state <= IDLE;
			else
				n_state <= STOP;
			end if;
		when others =>
			null;
   end case;
end process;

process(clk,p_state,t_reset)
begin

if(rising_edge(clk)) then
		case p_state is
			when START =>
				if t_reset = '1' then
				msec <= '0';
				cnt <= "00000000000000000";
				elsif (cnt = "11000011010100000") THEN
				cnt <= "00000000000000000";
				msec <= '1';
				ELSE
				cnt <= cnt + "00000000000000001";
				msec <= '0';
				end if;
			when IDLE =>
				cnt <= "00000000000000000";
				msec <= '0';
			when STOP =>
				cnt <= cnt;
				msec <= '0';
		end case;
				
end if;
end process;

process(clk,msec,t_reset,p_state)
begin
	if ( rising_edge(clk)) then
		case p_state is
		when START =>
			if(t_reset = '1')  then
			l_count <= "00000000" ;
			elsif (msec = '1') then
			l_count <= l_count+1;
			else
			l_count <= l_count;
			end if;
		when STOP =>
			l_count <= l_count;
		when IDLE =>
			l_count <= "00000000";
		end case;
	end if;
	
time_ms <= l_count;
end process;

end Behavioral;