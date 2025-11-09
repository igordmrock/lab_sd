library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity somador_arith_val_5 is
	port(
	A : in std_logic_vector(7 downto 0);
	B : in std_logic_vector(7 downto 0);
	S : out std_logic_vector(8 downto 0)
	);
end somador_arith_val_5;

architecture rtl of somador_arith_val_5 is
begin
	S <= unsigned('0' & A) + unsigned('0' & B);
end rtl;
