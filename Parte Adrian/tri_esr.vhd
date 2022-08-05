-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEO DE ESTRUCTURAS JERRQUICAS
-- DISEO DE UN MICROPROCESADOR - REGISTRO TRI-EST
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_esr is
    Port ( 
			  clk: in std_logic;
	  operacion: in std_logic_vector(3 downto 0);
	         cs: in std_logic_vector(4 downto 0);
		  datout: inout std_logic_vector(3 downto 0));
end tri_esr;

architecture arq_tri of tri_esr is
begin
	process(clk, cs)
	begin
		if (clk' event and clk = '1') then
			case cs is
				when "11000" => datout <= operacion;
				when others => datout <= "ZZZZ";
			end case;
		end if;
	end process;
end arq_tri;