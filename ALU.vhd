----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:39 07/26/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu4 is
port(	clk : in std_logic;
		a,b : in std_logic_vector (3 downto 0);
		cs : in std_logic_vector (4 downto 0);
		operacion : inout std_logic_vector (3 downto 0);
		rc : inout std_logic_vector (3 downto 0));
end alu4;

architecture Behavioral of alu4 is
signal c1:std_logic_vector (1 downto 0);
begin
	process(clk)
	variable Cout : std_logic;
	begin
		if(clk'event and clk = '1')then
			case cs is
				when "00001" => operacion <= (a+b);
					c1(0) <= (a(1) and b(1)) or ((a(0) and b(0)) xor b(1));
					c1(1) <= (a(2) and b(2)) or ((c1(0) and a(2)) xor b(2));
					Cout := (a(3) and b(3)) or ((c1(1) and a(3)) xor b(3));
				when "00010" => operacion <= (a-b);
					if(a >= b)then
						Cout := '1';
						c1(0) <= '1';
					else
						Cout := '0';
						c1(0) <= '0';
					end if;
				when "00011" => operacion <= (a and b);
					Cout := '0';
					c1(0) <= '0';
				when "00100" => operacion <= (a or b);
					Cout := '0';
					c1(0) <= '0';
				when "00101" => operacion <= (not a);
					Cout := '0';
					c1(0) <= '0';
				when "00110" => operacion <= (a xor b);
					Cout := '0';
					c1(0) <= '0';
				when "00111" => operacion <= (a and "1111");
					Cout := '0';
					c1(0) <= '0';
				when others => null;
			end case;
			end if;
				rc(3) <= Cout xor c1(1);
				rc(2) <= not(operacion(3) or operacion(2) or operacion(1) or operacion(0));
				rc(1) <= operacion(3);
				rc(0) <= Cout;
		end process;
end Behavioral;

