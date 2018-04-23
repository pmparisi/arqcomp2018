library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_tb is
end entity;

architecture f_a_tb of full_adder_tb is

--Se define el componente full_adder
component full_adder is
    port (
        A: 		in  std_logic;
        B: 		in  std_logic;
        Cin:	in  std_logic;
        S: 		out std_logic;
        Cout:  out std_logic
    );
end component;

--Se definen las señales de interconexion
--Entradas
signal A_i   :  std_logic;
signal B_i   :  std_logic;
signal C_i   :  std_logic;
--Salidas
signal S_o   :  std_logic;
signal C_o   :  std_logic;

--Se declara vector de testeo
type test_vector is record
    A_i   :  std_logic;
    B_i   :  std_logic;
    C_i   :  std_logic;
    S_o   :  std_logic;
    C_o   :  std_logic;
end record; 

--Se declara un arreglo de vectores de testeo
type test_vector_arreglo is array(natural range<>) of test_vector;

--Se declara y llena el arreglo con los vectores de prueba
constant t_v : test_vector_arreglo := (
    --Se forman todas las combinaciones posibles para las entradas/Salidas
    (A_i => '0', B_i => '0', C_i => '0', S_o => '0', C_O => '0'), -- 000 = 00
    (A_i => '0', B_i => '0', C_i => '1', S_o => '1', C_O => '0'), -- 001 = 10
    (A_i => '0', B_i => '1', C_i => '0', S_o => '1', C_O => '0'), -- 010 = 10 
    (A_i => '0', B_i => '1', C_i => '1', S_o => '0', C_O => '1'), -- 011 = 01
    (A_i => '1', B_i => '0', C_i => '0', S_o => '1', C_O => '0'), -- 100 = 10
    (A_i => '1', B_i => '0', C_i => '1', S_o => '0', C_O => '1'), -- 101 = 01
    (A_i => '1', B_i => '1', C_i => '0', S_o => '0', C_O => '1'), -- 110 = 01
    (A_i => '1', B_i => '1', C_i => '1', S_o => '1', C_O => '1')  -- 111 = 11
);

begin

--Se instancia el componente full_adder
uut: full_adder port map(
    A 	=> A_i,
    B 	=> B_i,
    Cin 	=> C_i,
    S 	=> S_o,
    Cout => C_o
    );

--Se aplican los vectores de prueba y se verifican los resultados
verificar: process 
    variable vector: test_vector;
    variable errores: boolean := false;
begin
    for i in t_v'range loop
		  --Se aplican los vectores de prueba
        vector := t_v(i);
        A_i <= vector.A_i;
        B_i <= vector.B_i;
        C_i <= vector.C_i;
        wait for 100 ns;
		  --Se verifican las salidas con los vectores asignados en el vector
		  --Se verifica S_o
        if S_o /= vector.S_o then
            assert false
            report "Error en S_o";
            errores := true;
        end if;
        --Se verifica C_o
        if C_o /= vector.C_o then
            assert false
            report "Error en C_o";
            errores := true;
        end if;
    end loop;
    --Se reporta si hubo errores
    assert not errores
        report "fulladder paso el testeo"
        severity note;
    assert errores
        report "Paso el testeo"
        severity note;
    wait;
end process;

end architecture f_a_tb;
