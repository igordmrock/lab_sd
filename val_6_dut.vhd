library ieee;
use ieee.std_logic_1164.all;

entity val_6_dut is
port( 
	D, CLK, CLR : in std_logic;
	Q : out std_logic
);
end val_6_dut;

architecture dut of val_6_dut is
	
	component flipflop_JK is
	port(
		JK : in std_logic_vector(1 downto 0);
		PR, CLR, CLK : in std_logic;
		Q : out std_logic
	);
	end component;

signal DnotD : std_logic_vector(1 downto 0);

begin
DnotD(1) <= D;
DnotD(0) <= not(D);

flipflop_D : flipflop_JK port map(JK => DnotD, PR => '0', CLR => CLR, CLK => CLK, Q => Q);

end dut;
