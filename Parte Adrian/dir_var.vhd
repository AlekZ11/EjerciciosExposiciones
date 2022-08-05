-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEO DE ESTRUCTURAS JERRQUICAS
-- DISEO DE UN MICROPROCESADOR - REGISTRO DIR-VAR
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dir_var is
    Port ( 
	         cs: in std_logic_vector(4 downto 0);
			  vma: out std_logic);
end dir_var;

architecture arq_dir_var of dir_var is
begin
	process(cs)
	begin
		vma <= (not(cs (3)) and cs(2) and cs(1) and not(cs (0)))
			 or (cs(3) and not(cs (2)) and not(cs (1)) and not(cs(0)));
	end process;
end arq_dir_var;