library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity op_not is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S1: 	out 	std_logic_vector(N-1 downto 0);
		S2: 	out 	std_logic_vector(N-1 downto 0)
	);
end op_not;

--Defino arquitectura
architecture o_n of op_not is

begin
proceso_and: process(A,B)
begin
	for i in 0 to N-1 loop
		S1(i) <= not(A(i));
		S2(i) <= not(B(i));
	end loop;
end process;
	
end o_n;