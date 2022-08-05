-------------------------------------------------------------
-- 					Grupo 5
-- 		UNIVERSIDAD NACIONAL DE LOJA
--  	DISEÑO DE ESTRUCTURAS JERÁRQUICAS
-- DISEÑO DE UN MICROPROCESADOR - REGISTRO SEL-DIR
-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sel_dir is
    Port ( 
			  clk: in  std_logic;
	      pcout: in std_logic_vector(7 downto 0);
			   ix: in std_logic_vector(7 downto 0);
	         cs: in std_logic_vector(4 downto 0);
	  direccion: out std_logic_vector(7 downto 0));
end sel_dir;

architecture arq_sel_dir of sel_dir is
begin
	process(clk, cs)
	begin
		if (clk' event and clk = '1') then
			case cs is
				when "11000" => direccion <= ix;
				when others => direccion <= pcout;
			end case;
		end if;
	end process;
end arq_sel_dir;