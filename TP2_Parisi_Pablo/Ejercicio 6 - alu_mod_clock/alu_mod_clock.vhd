library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Defino entidad
entity alu_mod_clock is
	generic (N: integer :=7);
	port(
		Ai: 		in 	std_logic_vector(N-1 downto 0);
		Bi: 		in 	std_logic_vector(N-1 downto 0);
		Cini: 	in 	std_logic;
		Sel0i:	in 	std_logic;
		Sel1i:	in 	std_logic_vector(1 downto 0);
		reset:	in		std_logic;
		clock:	in		std_logic;		
		Sal1o:	out 	std_logic_vector(N-1 downto 0)
	);
end alu_mod_clock;


--Defino arquitectura
architecture alu_arch_clock_mod of alu_mod_clock is

component alu_mod is
	generic (N: integer :=7);
	port(
		Ai: 		in 	std_logic_vector(N-1 downto 0);
		Bi: 		in 	std_logic_vector(N-1 downto 0);
		Cini: 	in 	std_logic;
		Sel0i:	in 	std_logic;
		Sel1i:	in 	std_logic_vector(1 downto 0);
		Sal1o:	out 	std_logic_vector(N-1 downto 0)
	);
end component;

signal A: 		std_logic_vector(N-1 downto 0);
signal B: 		std_logic_vector(N-1 downto 0);
signal Cin:		std_logic;
signal Sel0:	std_logic;
signal Sel1:	std_logic_vector(1 downto 0);	
signal S0:	  std_logic_vector(N-1 downto 0);

begin

comp_alu: alu_mod
generic map (N)
port map (
	Ai		=> A,
	Bi		=> B,
	Cini	=> Cin,
	Sel0i	=> Sel0,
	Sel1i	=> Sel1,
	Sal1o	=> S0
);

process(clock,reset)
begin
	if (reset='1') then
		Sal1o <= (others=>'0');
	elsif (clock'event and clock='1') then
		A	 	<= Ai;
		B 		<= Bi;
		Cin	<= Cini;
		Sel0	<= Sel0i;
		Sel1	<= Sel1i;
		Sal1o <= S0;
	end if;
end process;

end alu_arch_clock_mod;