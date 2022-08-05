-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEÑO DE ESTRUCTURAS JERÁRQUICAS
-- DISEÑO DE UN MICROPROCESADOR - REGISTRO DE PILA
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity stack is
    Port ( 
			  clk: in  std_logic;
		   pcout: in std_logic_vector(7 downto 0);
	         cs: in std_logic_vector(4 downto 0);
	      reset: in std_logic;
			 pila: inout std_logic_vector(7 downto 0));
end stack;

architecture arq_stack of stack is
begin
	process(clk, cs, reset)
	variable q: std_logic_vector (7 downto 0);
	begin
	if reset = '1' then
		pila <= "00000000";
	else
		if (clk' event and clk = '1') then
			case cs is
				when "11100" => pila <= pcout;
				when others => null;
			end case;
		end if;
	end if;
	end process;
end arq_stack;