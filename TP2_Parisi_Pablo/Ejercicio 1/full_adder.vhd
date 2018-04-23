library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity full_adder is
	port(
		A: 	in 	std_logic;
		B: 	in 	std_logic;
		Cin: 	in 	std_logic;
		S: 	out 	std_logic;
		Cout: out 	std_logic
	);
end full_adder;

--Defino arquitectura
architecture f_a of full_adder is
signal X: std_logic;
begin
	X <= A xor B;
	S <= X xor Cin;
	Cout <= (A and B) or (X and Cin);
end f_a;