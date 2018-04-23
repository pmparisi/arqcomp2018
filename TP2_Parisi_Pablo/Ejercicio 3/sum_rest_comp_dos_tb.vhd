library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_rest_comp_dos_tb is
end entity;

architecture s_r_c_d_tb of sum_rest_comp_dos_tb is

--Se define el componente sum_rest_comp_dos
component sum_rest_comp_dos is
	 generic (N: natural:=8);
    port (
        A: 		in  std_logic_vector(N-1 downto 0);
        B: 		in  std_logic_vector(N-1 downto 0);
        Cin:	in  std_logic;
		  Sel:	in	 std_logic;
        S: 		out std_logic_vector(N-1 downto 0);
        Cout:  out std_logic
    );
end component;

--Se definen las seniales de interconexion
--Se define cantidad de bits
constant N:	 natural :=8;
--Entradas
signal A_i:  	std_logic_vector(N-1 downto 0);
signal B_i:  	std_logic_vector(N-1 downto 0);
signal C_i: 	std_logic;
signal Sel_i:  std_logic;
--Salidas
signal S_o:  	std_logic_vector(N-1 downto 0);
signal C_o:  	std_logic;

begin

--Se instancia el componente sum_rest_comp_dos
uut: sum_rest_comp_dos
	 generic map(
	 N		=>	N
	 )
	 port map(
    A 	=> A_i,
    B 	=> B_i,
    Cin 	=> C_i,
	 Sel 	=> Sel_i,
    S 	=> S_o,
    Cout => C_o
    );

--Se aplican los vectores de prueba y se verifican los resultados
verificar: process
begin
	Sel_i <= '0';
	C_i <= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			wait for 10 ns;
		end loop;
	end loop;
	wait for 100 ns;
	Sel_i <= '1';
	C_i <= '0';
	for i in 0 to (2**N)-1 loop	
		A_i<= std_logic_vector(to_unsigned(i,N));
		for j in 0 to (2**N)-1 loop
			B_i <= std_logic_vector(to_unsigned(j,N));
			wait for 10 ns;
		end loop;
	end loop;
	wait;
end process;

end architecture s_r_c_d_tb;