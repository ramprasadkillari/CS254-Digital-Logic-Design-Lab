----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:50 03/27/2019 
-- Design Name: 
-- Module Name:    gl6_vendingmachine - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gl6_vendingmachine is
port(
item_in     : in std_logic_vector(2 downto 0); --1 to 7 in order 1 for Misal and 7 for Chai
clk         : in std_logic;
money_in : in std_logic_vector(3 downto 0); --0 default 1 to 8 in order 1 for 1000 and 8 for 5 rs coin
money_out: OUT std_logic;--_vector(3 downto 0);
item_out : out std_logic_vector(2 downto 0));
end gl6_vendingmachine;

architecture Behavioral of gl6_vendingmachine is

type states is (IDLE,WAIT_FOR_M,CANT_S,COIN_D,ITEM_D);
signal p_state : states := IDLE;
signal refund : STD_LOGIC;
signal item_outp : std_logic_vector(2 downto 0) := "000";
signal item_m: INTEGER := 0;
signal money_inp : std_logic_vector(3 downto 0) := "0000";

begin

process(clk)
variable money_rec : INTEGER range 0 to 2025 := 0;
variable change : INTEGER range 0 to 400:= 0;
variable item_m : INTEGER range 0 to 30 := 0;
variable inp_m		 : INTEGER range 0 to 2000 := 0;
variable m_enough,refund : std_logic := '0';
variable n_state : states := IDLE;
begin
if rising_edge(clk) then
p_state <= n_state;
case p_state is 
		when IDLE =>
			item_outp <= "000";
			m_enough := '0';
			inp_m := 0;
			change := 0;
			money_rec := 0;
			if item_in = "000" then
				n_state := IDLE;
			elsif item_in = "001" then
				n_state := WAIT_FOR_M;
				item_m := 25;
			elsif item_in = "010" then
				n_state := WAIT_FOR_M;
				item_m := 10;
			elsif item_in = "011" then
				n_state := WAIT_FOR_M;
				item_m := 25;
			elsif item_in = "100" then
				n_state := WAIT_FOR_M;
				item_m := 30;
			elsif item_in = "101" then
				n_state := WAIT_FOR_M;
				item_m := 5;
			elsif item_in = "110" then
				n_state := WAIT_FOR_M;
				item_m := 15;
			elsif item_in = "111" then
				n_state := WAIT_FOR_M;
				item_m := 10;
			end if;
		
		when WAIT_FOR_M =>
			case money_in is
				when "0000" =>
					inp_m := 0; 
				when "0001" =>
					inp_m := 2000;
				when "0010" =>
					inp_m := 500;
				when "0011" =>
					inp_m := 100;
				when "0100" =>
					inp_m := 50;
				when "0101" =>
					inp_m := 20;
				when "0110" =>
					inp_m := 10;
				when "0111" =>
					inp_m := 10;
				when "1000" =>
					inp_m := 5;
				when others=>
					inp_m := 0;
			end case;
			money_rec:= money_rec+inp_m;
			
			if (m_enough = '0') then
				if(inp_m = 0) then
					n_state := CANT_S;
					change := (money_rec-item_m)/5;
				elsif(money_rec >= item_m) then
					n_state := COIN_D;
					m_enough := '1';
					change := (money_rec-item_m)/5;
				else
					n_state := WAIT_FOR_M;
					m_enough := '0';
				end if;
			end if;
		when COIN_D =>
			if(change > 1) then
				n_state := COIN_D;
				change := change-1;
				refund := '1';
			else
				n_state := ITEM_D;
				refund := '1';
				change := 0;
			end if;
		when ITEM_D =>
			refund := '0';
			item_outp <= item_in;
			n_state := IDLE;
		when CANT_S =>
			if(change > 0) then
				n_state := CANT_S;
				change := change-1;
				refund := '1';
			else
				n_state := IDLE;
				refund := '0';
			end if;
			
	end case;
	money_out <= refund;
	p_state <= n_state;
end if;
end process;

item_out <= item_outp;
end Behavioral;

