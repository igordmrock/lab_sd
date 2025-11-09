library ieee;
use ieee.std_logic_1164.all;

entity val_5_dut is
	port( A : in std_logic_vector(7 downto 0);
	      B : in std_logic_vector(7 downto 0);
	      S : out std_logic_vector(8 downto 0)
	);
end val_5_dut;

architecture dut of val_5_dut is
	
	component somador_completo_val_5 is
	port (
	    A, B, Cin : in std_logic;
	    S, Cout : out std_logic
	);
	end component;

signal Carry_signal : std_logic_vector(8 downto 0);

begin
Carry_signal(0) <= '0';
somador_0 : somador_completo_val_5 port map (A(0), B(0), Carry_signal(0), S(0), Carry_signal(1));
somador_1 : somador_completo_val_5 port map (A(1), B(1), Carry_signal(1), S(1), Carry_signal(2));
somador_2 : somador_completo_val_5 port map (A(2), B(2), Carry_signal(2), S(2), Carry_signal(3));
somador_3 : somador_completo_val_5 port map (A(3), B(3), Carry_signal(3), S(3), Carry_signal(4));
somador_4 : somador_completo_val_5 port map (A(4), B(4), Carry_signal(4), S(4), Carry_signal(5));
somador_5 : somador_completo_val_5 port map (A(5), B(5), Carry_signal(5), S(5), Carry_signal(6));
somador_6 : somador_completo_val_5 port map (A(6), B(6), Carry_signal(6), S(6), Carry_signal(7));
somador_7 : somador_completo_val_5 port map (A(7), B(7), Carry_signal(7), S(7), Carry_signal(8));
S(8) <= Carry_signal(8);

end dut;
