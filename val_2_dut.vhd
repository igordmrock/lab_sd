library ieee;
use ieee.std_logic_1164.all;

entity val_2_dut is
	port( A : in std_logic_vector(2 downto 0);
	      B : in std_logic_vector(2 downto 0);
	      S : out std_logic_vector(3 downto 0)
	);
end val_2_dut;

architecture dut of val_2_dut is
	
	component somador_completo_val_2 is
	port (
	    A, B, Cin : in std_logic;
	    S, Cout : out std_logic
	);
	end component;

signal Carry_signal : std_logic_vector(3 downto 0);

begin
Carry_signal(0) <= '0';
somador_0 : somador_completo_val_2 port map (A(0), B(0), Carry_signal(0), S(0), Carry_signal(1));
somador_1 : somador_completo_val_2 port map (A(1), B(1), Carry_signal(1), S(1), Carry_signal(2));
somador_2 : somador_completo_val_2 port map (A(2), B(2), Carry_signal(2), S(2), Carry_signal(3));
S(3) <= Carry_signal(3);

end dut;
