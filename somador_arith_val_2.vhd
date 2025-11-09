library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity somador_arith_val_2 is
	port(
	A : in std_logic_vector(2 downto 0);
	B : in std_logic_vector(2 downto 0);
	S : out std_logic_vector(3 downto 0)
	);
end somador_arith_val_2;

architecture rtl of somador_arith_val_2 is
begin
	S <= unsigned('0' & A) + unsigned('0' & B);
end rtl;
