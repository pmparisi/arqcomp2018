library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_clock_tb is
end entity;

architecture a_c_tb of alu_clock_tb is

--Se define el componente alu
component alu_clock is
	generic (N: integer :=7);
	port(
		Ai: 		in 	std_logic_vector(N-1 downto 0);
		Bi: 		in 	std_logic_vector(N-1 downto 0);
		Cini: 	in 	std_logic;
		Seli:		in		std_logic;
		Sel0i:	in 	std_logic;
		Sel1i:	in 	std_logic_vector(1 downto 0);
		reset:	in		std_logic;
		clock:	in		std_logic;
		Sal1o:	out 	std_logic_vector(N-1 downto 0)
	);
end component;

--Se definen las seniales de interconexion
--Se define cantidad de bits
constant N:	 natural :=7;
--Entradas
signal A_i:  	std_logic_vector(N-1 downto 0);
signal B_i:  	std_logic_vector(N-1 downto 0);
signal C_i:  	std_logic;
signal Sel_i:	std_logic;
signal Sel0_i:	std_logic;
signal Sel1_i:	std_logic_vector(1 downto 0);
signal reset:  std_logic;
signal clock:  std_logic;
--Salidas
signal Sal1_o:  std_logic_vector(N-1 downto 0);

begin

--Se instancia el componente alu
uut: alu_clock
generic map(
	N		=>	N
)
port map(
   Ai 		=> A_i,
   Bi 		=> B_i,
   Cini 		=> C_i,
	Seli		=> Sel_i,
	Sel0i		=> Sel0_i,
	Sel1i		=> Sel1_i,
	reset		=> reset,
	clock		=> clock,
	Sal1o		=> Sal1_o
);

--Se aplican los vectores de prueba y se verifican los resultados
verificar: process
begin	
	Sel1_i 	<= "00";
	C_i		<= '0';
	Sel_i		<= '0';
	Sel0_i	<= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	Sel1_i 	<= "00";
	C_i		<= '0';
	Sel_i		<= '1';
	Sel0_i	<= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	Sel1_i 	<= "01";
	C_i		<= '0';
	Sel_i		<= '0';
	Sel0_i	<= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	Sel1_i 	<= "10";
	C_i		<= '0';
	Sel_i		<= '0';
	Sel0_i	<= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	Sel1_i 	<= "11";
	C_i		<= '0';
	Sel_i		<= '0';
	Sel0_i	<= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	Sel1_i 	<= "11";
	C_i		<= '0';
	Sel_i		<= '0';
	Sel0_i	<= '1';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			reset <='0';
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
		end loop;
	end loop;
	
	wait;
end process;


end architecture a_c_tb;