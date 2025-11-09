library ieee;
use ieee.std_logic_1164.all;

entity somador_completo_val_5 is
	port(
	A, B, Cin : in std_logic;
	S, Cout : out std_logic
	);
end somador_completo_val_5;

architecture rtl of somador_completo_val_5 is

	component decoder3x8 is
	port (A : in std_logic_vector(2 downto 0);
	      Y : out std_logic_vector(7 downto 0));
	end component;

	signal Y_1 : std_logic_vector(7 downto 0);

begin

decodificador : decoder3x8 port map(A(2) => A, A(1) => B, A(0) => Cin, Y => Y_1);

S <= Y_1(1) OR Y_1(2) OR Y_1(4) OR Y_1(7);
Cout <= Y_1(3) OR Y_1(5) OR Y_1(6) OR Y_1(7);

end rtl;

