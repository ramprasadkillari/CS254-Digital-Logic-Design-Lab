----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:04 03/22/2019 
-- Design Name: 
-- Module Name:    seq_det - Behavioral 
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


entity seq_det is
port(
seq : in  std_logic_vector(1071 downto 0);
clk : in std_logic;
det : out std_logic
);
end seq_det;

architecture Behavioral of seq_det is

type states is (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X);
signal p_state : states := A;
signal outp : std_logic := '0';
signal index	 : integer range 0 to 1071 := 1071;
begin

--n_state <= B; 
----				A;
--
--process(clk)
--begin
--if(rising_edge(clk)) then
--	
--end if;
--end process;


--
--process(clk,inp,p_state)
--begin
--if(rising_edge(clk)) then
--
--end if;
--end process;


process(clk)
variable inp : std_logic := seq(1071);
variable n_state : states := A;
begin
if(rising_edge(clk)) then
	
	if(index >= 0) then
--		p_state <= n_state;
		index <= index-1;
		inp := seq(index);
	end if;

	if(p_state = X and inp = '1') then
		outp <= '1';
	else 
		outp <= '0';
	end if;

	case p_state is
		when A =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := B;
			end if;
		when B =>
			if(inp = '0') then 
				n_state := C;
			else
				n_state := B;
			end if;
		when C =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := D;
			end if;
		when D =>
			if(inp = '0') then 
				n_state := E;
			else
				n_state := B;
			end if;
		when E =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := F;
			end if;
		when F =>
			if(inp = '0') then 
				n_state := G;
			else
				n_state := B;
			end if;
		when G =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := H;
			end if;
		when H =>
			if(inp = '0') then 
				n_state := I;
			else
				n_state := B;
			end if;
		when I =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := J;
			end if;
		when J =>
			if(inp = '0') then 
				n_state := I;
			else
				n_state := K;
			end if;
		when K =>
			if(inp = '0') then 
				n_state := C;
			else
				n_state := L;
			end if;
		when L =>
			if(inp = '0') then 
				n_state := C;
			else
				n_state := M;
			end if;
		when M =>
			if(inp = '0') then 
				n_state := N;
			else
				n_state := B;
			end if;
		when N =>
			if(inp = '0') then 
				n_state := O;
			else
				n_state := D;
			end if;
		when O =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := P;
			end if;
		when P =>
			if(inp = '0') then 
				n_state := Q;
			else
				n_state := B;
			end if;
		when Q =>
			if(inp = '0') then 
				n_state := R;
			else
				n_state := D;
			end if;
		when R =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := S;
			end if;
		when S =>
			if(inp = '0') then 
				n_state := T;
			else
				n_state := B;
			end if;
		when T =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := U;
			end if;
		when U =>
			if(inp = '0') then 
				n_state := V;
			else
				n_state := B;
			end if;
		when V =>
			if(inp = '0') then 
				n_state := W;
			else
				n_state := F;
			end if;
		when W =>
			if(inp = '0') then 
				n_state := A;
			else
				n_state := X;
			end if;
		when X =>
			if(inp = '0') then 
				n_state := C;
			else
				n_state := A; -- NON-overlaping / B -- overlapping
			end if;
	end case;
	p_state <= n_state;
end if;
end process;

det <= outp;

end Behavioral;

