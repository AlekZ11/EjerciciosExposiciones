-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEÑO DE ESTRUCTURAS JERÁRQUICAS
-- DISEÑO DE UN MICROPROCESADOR - REGISTRO SEL-DATO
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sel_dato is
    Port ( 
			  clk: in  std_logic;
		  datoin: in std_logic_vector(3 downto 0);
	  operacion: in std_logic_vector(3 downto 0);
	         cs: in std_logic_vector(4 downto 0);
		  datout: inout std_logic_vector(3 downto 0));
end sel_dato;

architecture arq_sel_dato of sel_dato is
begin
	process(clk, cs)
	begin
		if (clk' event and clk = '1') then
			case cs is
				when "10110" => datout <= datoin;
				when "10101" => datout <= operacion;
				when others => null;
			end case;
		end if;
	end process;
end arq_sel_dato;