-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEÑO DE ESTRUCTURAS JERÁRQUICAS
-- DISEÑO DE UN MICROPROCESADOR - ACUMULADOR A Y B
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- ACUMULADOR A
entity rega5 is
    Port ( 
			  clk: in  std_logic;
		  datoin: in std_logic_vector(3 downto 0);
	         cs: in std_logic_vector(4 downto 0);
	      reset: in std_logic;
				 a: inout std_logic_vector(3 downto 0));
end rega5;

architecture impedancia of rega5 is
begin
	process(clk, cs, reset)
	variable ares: std_logic_vector (3 downto 0);
	begin
	if reset = '1' then
		a <= "0000";
	else
		if (clk' event and clk = '1') then
			case cs is
				when "10001" =>   a  <= datoin;
				when "11100" => ares := a;
				when "11101" =>   a  <= ares;
				when others  => null;
			end case;
		end if;
	end if;
	end process;
end impedancia;