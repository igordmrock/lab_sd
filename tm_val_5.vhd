library ieee;
use ieee.std_logic_1164.all;

entity tm_val_5 is
end tm_val_5;

architecture top_module_arch of tm_val_5 is

	component val_5_dut is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		S : out std_logic_vector(8 downto 0)
	);
	end component;

	component somador_arith_val_5 is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		S : out std_logic_vector(8 downto 0)
	);
	end component;

	component testbench_val_5 is
	port(
		A : out std_logic_vector(7 downto 0);
		B : out std_logic_vector(7 downto 0);
		Sdut : in std_logic_vector(8 downto 0);
		Sgm : in std_logic_vector(8 downto 0)
	);
	end component;

	signal A_1, B_1 : std_logic_vector(7 downto 0);
	signal S_dut, S_gm : std_logic_vector(8 downto 0);

	begin
	somador_dut : val_5_dut port map(A_1, B_1, S_dut);
	somador_gm : somador_arith_val_5 port map(A_1, B_1, S_gm);
	testbench : testbench_val_5 port map(A_1, B_1, S_dut, S_gm);

end top_module_arch;
