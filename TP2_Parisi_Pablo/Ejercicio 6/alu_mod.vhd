library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity alu_mod is
	generic (N: integer :=7);
	port(
		Ai: 		in 	std_logic_vector(N-1 downto 0);
		Bi: 		in 	std_logic_vector(N-1 downto 0);
		Cini: 	in 	std_logic;
		Sel0i:	in 	std_logic;
		Sel1i:	in 	std_logic_vector(1 downto 0);
		Sal1o:	out 	std_logic_vector(N-1 downto 0)
	);
end alu_mod;


--Defino arquitectura
architecture alu_arch_mod of alu_mod is

component alu is
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
end component;

signal Selec: std_logic;
signal S0:	  std_logic_vector(N-1 downto 0);

begin

comp_alu: alu
generic map (N)
port map (
	Ai		=> Ai,
	Bi		=> Bi,
	Cini	=> Cini,
	Seli	=> Selec,
	Sel0i	=> Sel0i,
	Sel1i	=> Sel1i,
	Sal1o	=> S0
);

Selec <= '1';
Sal1o <= S0;

end alu_arch_mod;