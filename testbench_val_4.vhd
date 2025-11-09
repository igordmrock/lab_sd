library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench_val_4 is
	port(
		Sdut, Sgm : in std_logic_vector(4 downto 0);
		A, B : out std_logic_vector(3 downto 0)
	);
end testbench_val_4;


architecture behave of testbench_val_4 is
begin
process
begin  
	report "Iniciando  teste ..."  severity  NOTE;
	for i in 0 to 16 loop 
        	A <= std_logic_vector(to_unsigned(i, 4));

        	for j in 0 to 16 loop
  	        	B <= std_logic_vector(to_unsigned(j, 4));
			wait for 500 ns;

                	assert(Sdut = Sgm) report "Teste Falhou" severity ERROR;
       		     	end loop;
	end loop;
	report "Teste  finalizado!"  severity  NOTE;
	wait;
end process;
end behave;
