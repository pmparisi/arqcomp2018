library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity alu is
	generic (N: integer :=7);
	port(
		Ai: 		in 	std_logic_vector(N-1 downto 0);
		Bi: 		in 	std_logic_vector(N-1 downto 0);
		Cini: 	in 	std_logic;
		Seli:		in		std_logic;
		Sel0i:	in 	std_logic;
		Sel1i:	in 	std_logic_vector(1 downto 0);
		Sal1o:	out 	std_logic_vector(N-1 downto 0)
	);
end alu;

--Defino arquitectura
architecture alu_arch of alu is

component sum_rest_comp_dos is
	generic (N: integer:=7);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		Cin: 	in 	std_logic;
		Sel:	in		std_logic;
		S: 	out 	std_logic_vector(N-1 downto 0);
		Cout: out 	std_logic
	);
end component;

component op_and is
	generic (N: integer :=7);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S: 	out 	std_logic_vector(N-1 downto 0)
	);
end component;

component op_or is
	generic (N: integer :=7);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S: 	out 	std_logic_vector(N-1 downto 0)
	);
end component;

component op_not is
	generic (N: integer :=7);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S1: 	out 	std_logic_vector(N-1 downto 0);
		S2: 	out 	std_logic_vector(N-1 downto 0)
	);
end component;

signal C1: 	 std_logic;
signal SS1:	 std_logic_vector(N-1 downto 0);
signal SS2:	 std_logic_vector(N-1 downto 0);
signal S1: 	 std_logic_vector(N-1 downto 0);
signal S2: 	 std_logic_vector(N-1 downto 0);
signal S3: 	 std_logic_vector(N-1 downto 0);
signal S4: 	 std_logic_vector(N-1 downto 0);

begin

srcd: sum_rest_comp_dos
generic map (N)
port map (
	A 		=> Ai,
	B 		=> Bi,
	Cin	=> Cini,
	Sel	=> Seli,
	S 		=> S1,
	Cout 	=> C1
);

o_a: op_and
port map (
	A 		=> Ai,
	B 		=> Bi,
	S 		=> S2
);

o_o: op_or
port map (
	A 		=> Ai,
	B 		=> Bi,
	S 		=> S3
);

o_n: op_not
port map (
	A 		=> Ai,
	B 		=> Bi,
	S1		=> SS1,
	S2		=> SS2
);

S4 <= SS1 when (Sel0i = '0') else
		SS2 when (Sel0i = '1') else
		(others => '0');

Sal1o <= S1	 when (Sel1i = "00") else
			S2	 when (Sel1i = "01") else
			S3	 when (Sel1i = "10") else
			S4	 when (Sel1i = "11") else
			(others => '0');


end alu_arch;
	