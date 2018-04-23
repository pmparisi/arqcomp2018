library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity ripple_carry_adder is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		Cin: 	in 	std_logic;
		S: 	out 	std_logic_vector(N-1 downto 0);
		Cout: out 	std_logic
	);
end ripple_carry_adder;

--Defino arquitectura
architecture rca of ripple_carry_adder is

component full_adder is
	port(
		A:		in 	std_logic;
		B:		in 	std_logic;
		Cin:	in 	std_logic;
		S:		out	std_logic;
		Cout:	out 	std_logic
	);
end component;

signal carry: std_logic_vector(N downto 0);

begin
	carry(0) <= Cin;
	Cout <= carry(N);
	Generar: for i in 0 to N-1 generate
	N_full_adder: full_adder port map
		(A(i),B(i),carry(i),S(i),carry(i+1));
	end generate;
	
end rca;