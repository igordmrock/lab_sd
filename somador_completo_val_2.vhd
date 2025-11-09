library ieee;
use ieee.std_logic_1164.all;

entity somador_completo_val_2 is
	port(
	A, B, Cin : in std_logic;
	S, Cout : out std_logic
	);
end somador_completo_val_2;

architecture rtl of somador_completo_val_2 is
begin
	S <= A XOR B XOR Cin;
	Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);
end rtl;

