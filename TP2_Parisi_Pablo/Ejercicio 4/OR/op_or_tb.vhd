library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_or_tb is
end entity;

architecture o_o_tb of op_or_tb is

--Se define el componente op_and
component op_or is
	generic (N: integer :=8);
	port(
		A: 	in 	std_logic_vector(N-1 downto 0);
		B: 	in 	std_logic_vector(N-1 downto 0);
		S: 	out 	std_logic_vector(N-1 downto 0)
    );
end component;

--Se definen las seniales de interconexion
--Se define cantidad de bits
constant N:	 natural :=8;
--Entradas
signal A_i   :  std_logic_vector(N-1 downto 0);
signal B_i   :  std_logic_vector(N-1 downto 0);
--Salidas
signal S_o   :  std_logic_vector(N-1 downto 0);

 
begin
 
--Se instancia el componente op_or
uut: op_or 
	 generic map(
		N => N
	 )
	port map(
		A => A_i,
		B => B_i,
		S => S_o
	);

--Se aplican los vectores de prueba y se verifican los resultados
verificar: process
   begin		
	for i in 0 to 9 loop	
		A_i <= std_logic_vector(to_unsigned(i,N));
		B_i <= std_logic_vector(to_unsigned(i+N+5,N));
		wait for 50 ns;
	end loop;
	wait;
end process;

end o_o_tb;
