----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:38 04/10/2019 
-- Design Name: 
-- Module Name:    gl8_trafficlight - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gl8_trafficlight is
port(        -- EK, BF, DJ always on
Q_A          : in std_logic_vector(2 downto 0);
Q_B          : in std_logic_vector(2 downto 0);
Q_C          : in std_logic_vector(2 downto 0);
Q_D          : in std_logic_vector(2 downto 0);
Q_E          : in std_logic_vector(2 downto 0);
Q_H          : in std_logic_vector(2 downto 0);
Q_A1         : in std_logic_vector(2 downto 0);
Q_B1         : in std_logic_vector(2 downto 0);
S_A          : in std_logic;
S_B          : in std_logic;
S_C          : in std_logic;
S_D          : in std_logic;
S_E          : in std_logic;
S_H          : in std_logic;
S_A1         : in std_logic;
S_B1         : in std_logic;
clk          : in std_logic;
-- traffic light 3 bits. Green : 100, Amber : 010, Red : 001
light_ajbkcj_mg : out std_logic_vector(2 downto 0); -- AJ, BK, CJ single traffic light and stop others
light_cfdf_mg : out std_logic_vector(2 downto 0); -- allow ck also, stop AJ,BK,CJ,EJ,DK
light_dkej_mg : out std_logic_vector(2 downto 0); -- allow ck also, stop AJ,BK,CF,DF,CJ
light_ck_mg : out std_logic_vector(2 downto 0); -- allow ck;
light_aj_pw : out std_logic_vector(2 downto 0); -- stop BG, HK
light_bg_pw : out std_logic_vector(2 downto 0); -- stop AJ, HK
light_hk_pw : out std_logic_vector(2 downto 0) -- stop AJ, BG
);
end gl8_trafficlight;

architecture Behavioral of gl8_trafficlight is

type states is (main1,main2,main3,powai1,powai2,powai3);
signal p_state1,n_state1: states := main1;
signal p_state2,n_state2 : states := powai1; 
signal ctr1, ctr4 : integer := 240;
signal ctr2, ctr3, ctr5, ctr6: integer := 60;


begin

process(clk) is
begin
	variable sumofq_pr_CDE : INTEGER range 0 to 9 :=  Q_C(0)+Q_D(0)+Q_C(1)+Q_D(1)+Q_C(2)+Q_D(2); -- sum of queues at c,d,e at present state
	variable sumofq_pr_BH : INTEGER range 0 to 9 :=  Q_B(0)+Q_H(0)+Q_B(1)+Q_H(1)+Q_B(2)+Q_H(2); -- sum of queues at c,d,e at present state
	variable Delta_M     : INTEGER range 0 to 9 := sumofq_pr_CDE;
	variable Delta_P     : INTEGER range 0 to 9 := sumofq_pr_BH;
	variable sumofq_pa_CDE, sumofq_pa_BH  : INTEGER range 0 to 9 := 0;
	
	begin
	if (rising_edge(clk)) then
	sumofq_pr_CDE := Q_C(0)+Q_D(0)+Q_E(0)+Q_C(1)+Q_D(1)+Q_E(1)+Q_C(2)+Q_D(2)+Q_E(2);
	Delta_M		 := sumofq_pr_CDE-sumofq_pa_CDE;
	Delta_P		 := sumofq_pr_BH-sumofq_pa_BH;
	case p_state1 is
    	when main1 =>
   	-- Delta = sumofq_pr - sumofq_pa, ctr = ctr - 50*Delta
					if(ctr1 > 0) then
						ctr1 <= ctr1 - 1 - 50*Delta_M;
						n_state1 <= main1;
					else
						n_state1 <= main2;
						ctr1 <= 240;
					end if;
					sumofq_pa_CDE := sumofq_pr_CDE;
    	when main2 =>
					if(ctr2 > 0 and S_C < 8 and S_D < 8) then
							n_state1 <= main2;
							ctr2 <= ctr2 - 1;
					else
							n_state1 <= main3;
							ctr2 <= 60;
							
					end if;
    	when main3 =>
					if(ctr3 > 0 and S_C < 8 and S_D < 8 and S_E < 8) then
							n_state1 <= main3;
							ctr3 <= ctr3 - 1;
					else
							n_state1 <= main1;
							ctr3 <= 60;
					end if;
	end case;
	
	case p_state2 is
    	when powai1 =>
   	-- Delta = sumofq_pr - sumofq_pa, ctr = ctr - 50*Delta
					if(ctr4 > 0) then
						ctr4 <= ctr4 - 1 - 50*Delta_P;
						n_state1 <= powai1;
					else
						n_state1 <= powai2;
						ctr4 <= 240;
					end if;
					sumofq_pa_BH := sumofq_pr_BH;
    	when powai2 =>
					if(ctr5 > 0 and S_B < 8) then
							n_state2 <= powai2;
							ctr5 <= ctr5 - 1;
					else
							n_state2 <= powai3;	
							ctr5 <= 60;
					end if;
    	when powai3 =>
					if(ctr6 > 0 and S_H < 8) then
							n_state2 <= powai3;
							ctr6 <= ctr6 - 1;
					else
							n_state2 <= powai1;
							ctr6 <= 60;
					end if;
	end case;
	
	end if;
	
	pstate1 <= pstate1 ;
	pstate2 <= nstate2 ;
 
end process;

process(clk) is
begin

	case p_state1 is
		when main1 =>
			light_ajbkcj_mg <=  100 -- on
			light_cfdf_mg <= 
			light_dkej_mg <= 
			light_ck_mg	 <=  -- off
		when main2 =>
			light_cfdf_mg <=  100 -- on
			light_ajbkcj_mg <=
			light_dkej_mg <=
			light_ck_mg	 <=  100 -- on			
		when main3 =>
			light_dkej_mg <=  100 -- on
			light_ajbkcj_mg <=
			light_cfdf_mg <=
			light_ck_mg	 <= 100 -- on			
	end case;
	
	case p_state2 is
		when powai1 =>
			light_aj_pw <=  100  -- on
			light_bg_pw <=
			light_hk_pw <=
		when powai2 =>
			light_bg_pw <=	 100 -- on
			light_aj_pw <=
			light_hk_pw <=
		when powai3 =>
			light_hk_pw	<=	 100 -- on	
			light_aj_pw <=
			light_bg_pw <=
	end case;
	
end process;

end Behavioral;