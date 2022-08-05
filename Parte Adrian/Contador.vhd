-------------------------------------------------------------
-- 						Grupo 5
-- 			UNIVERSIDAD NACIONAL DE LOJA
--  		DISEÑO DE ESTRUCTURAS JERÁRQUICAS
-- DISEÑO DE UN MICROPROCESADOR - CONTADOR DE PROGRAMA
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity pc is
    Port ( 
			  clk: in  std_logic;
		pcontrol: in std_logic_vector(7 downto 0);
	         cs: in std_logic_vector(4 downto 0);
	      reset: in std_logic;
	       pila: in std_logic_vector(7 downto 0);
	      pcout: inout std_logic_vector(7 downto 0));
end pc;

architecture arq_pc of pc is
begin
	process(clk, cs, reset)
	begin
	if reset = '1' then
		pcout <= "00000000";
	else
		if (clk' event and clk = '1') then
			case cs is
				when "11110" => pcout <= pcontrol;
				when "11111" => pcout <= pcout + 1;
				when "11101" => pcout <= pila;
				when others => null;
			end case;
		end if;
	end if;
	end process;
end arq_pc;