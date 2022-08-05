-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISE�O DE ESTRUCTURAS JER�RQUICAS
-- DISE�O DE UN MICROPROCESADOR - REGISTRO DE �NDICE
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity indice is
    Port ( 
			  clk: in  std_logic;
		pcontrol: in std_logic_vector(7 downto 0);
	         cs: in std_logic_vector(4 downto 0);
	      reset: in std_logic;
				ix: inout std_logic_vector(7 downto 0));
end indice;

architecture arq_indice of indice is
begin
	process(clk, cs, reset)
	begin
	if reset = '1' then
		ix <= "00000000";
	else
		if (clk' event and clk = '1') then
			case cs is
				when "11010" => ix <= pcontrol;
				when "11011" => ix <= ix + 1;
				when others => null;
			end case;
		end if;
	end if;
	end process;
end arq_indice;