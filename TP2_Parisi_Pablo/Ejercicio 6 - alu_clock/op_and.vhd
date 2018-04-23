library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity op_and is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S: 	out 	std_logic_vector(N-1 downto 0)
	);
end op_and;

--Defino arquitectura
architecture o_a of op_and is

begin
proceso_and: process(A,B)
begin
	for i in 0 to N-1 loop
		S(i) <= A(i) and B(i);
	end loop;
end process;
	
end o_a;