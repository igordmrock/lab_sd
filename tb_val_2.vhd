library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_val_2 is
	port(
		Sdut, Sgm : in std_logic_vector(3 downto 0);
		A, B : out std_logic_vector(2 downto 0)
	);
end tb_val_2;


architecture behave of tb_val_2 is
begin
process
begin  
	report "Iniciando  teste ..."  severity  NOTE;
	for i in 0 to 8 loop 
        	A <= std_logic_vector(to_unsigned(i, 3));

        	for j in 0 to 8 loop
  	        	B <= std_logic_vector(to_unsigned(j, 3));
			wait for 500 ns;

                	assert(Sdut = Sgm) report "Teste Falhou" severity ERROR;
       		     	end loop;
	end loop;
	report "Teste  finalizado!"  severity  NOTE;
	wait;
end process;
end behave;
