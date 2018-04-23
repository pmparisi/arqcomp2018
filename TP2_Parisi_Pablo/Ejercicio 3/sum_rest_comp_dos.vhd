library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity sum_rest_comp_dos is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		Cin: 	in 	std_logic;
		Sel:	in		std_logic;
		S: 	out 	std_logic_vector(N-1 downto 0);
		Cout: out 	std_logic
	);
end sum_rest_comp_dos;

--Defino arquitectura
architecture s_r_c_d of sum_rest_comp_dos is

component full_adder is
	port(
		A:		in 	std_logic;
		B:		in 	std_logic;
		Cin:	in 	std_logic;
		S:		out	std_logic;
		Cout:	out 	std_logic
	);
end component;

component ripple_carry_adder is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		Cin: 	in 	std_logic;
		S: 	out 	std_logic_vector(N-1 downto 0);
		Cout: out 	std_logic
	);
end component;

signal carry: std_logic_vector(N downto 0);
signal Bcomp: std_logic_vector(N-1 downto 0);
signal S0:	  std_logic_vector(N-1 downto 0);
signal C0:	  std_logic;

begin

rca: ripple_carry_adder
port map (
	A 		=> A,
	B 		=> Bcomp,
	Cin	=> Cin,
	S 		=> S0,
	Cout 	=> C0
);

	carry(0) <= Cin;
	Bcomp <= std_logic_vector(unsigned(not(B))+1) when (Sel ='0') else
		      B when (Sel ='1') else
		      (others=>'0');
	S <= S0;
	Cout <= C0;
	
end s_r_c_d;