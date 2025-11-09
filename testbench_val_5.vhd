library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity testbench_val_5 is
	port(
		Sdut, Sgm : in std_logic_vector(8 downto 0);
		A, B : out std_logic_vector(7 downto 0)
	);
end testbench_val_5;


architecture behave of testbench_val_5 is
begin
process
begin  
	report "Iniciando  teste ..."  severity  NOTE;
	for i in 0 to 256 loop 
        	A <= std_logic_vector(to_unsigned(i, 8));

        	for j in 0 to 256 loop
  	        	B <= std_logic_vector(to_unsigned(j, 8));
			wait for 500 ns;

                	assert(Sdut = Sgm) report "Teste falhou" severity ERROR;
       		     	end loop;
	end loop;
	report "Teste  finalizado!" severity  NOTE;
	wait;
end process;
end behave;
