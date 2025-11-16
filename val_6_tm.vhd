library ieee;
use ieee.std_logic_1164.all;

entity val_6_tm is
end val_6_tm;

architecture top_module_arch of val_6_tm is

	component val_6_dut is
	port( 
		D, CLK, CLR : in std_logic;
		Q : out std_logic
	);
	end component;

	component val_6_gm is
	port(
		D, CLK, CLR : in std_logic;
		Q : out std_logic
	);
	end component;

	component val_6_tb is
	port(
		Qdut, Qgm : in std_logic;
		D, CLK, CLR : out std_logic
	);
	end component;

	signal D_1, CLK_1, CLR_1 : std_logic;
	signal Q_dut, Q_gm : std_logic;

	begin
	flipflop_D_dut : val_6_dut port map(D_1, CLK_1, CLR_1, Q_dut);
	flipflop_D_gm : val_6_gm port map(D_1, CLK_1, CLR_1, Q_gm);
	testbench : val_6_tb port map(Q_dut, Q_gm, D_1, CLK_1, CLR_1);

end top_module_arch;
