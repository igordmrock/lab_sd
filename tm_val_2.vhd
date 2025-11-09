library ieee;
use ieee.std_logic_1164.all;

entity tm_val_2 is
end tm_val_2;

architecture top_module_arch of tm_val_2 is

	component val_2_dut is
	port(
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);
		S : out std_logic_vector(3 downto 0)
	);
	end component;

	component somador_arith_val_2 is
	port(
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);
		S : out std_logic_vector(3 downto 0)
	);
	end component;

	component tb_val_2 is
	port(
		A : out std_logic_vector(2 downto 0);
		B : out std_logic_vector(2 downto 0);
		Sdut : in std_logic_vector(3 downto 0);
		Sgm : in std_logic_vector(3 downto 0)
	);
	end component;

	signal A_1, B_1 : std_logic_vector(2 downto 0);
	signal S_dut, S_gm : std_logic_vector(3 downto 0);

	begin
	somador_dut : val_2_dut port map(A_1, B_1, S_dut);
	somador_gm : somador_arith_val_2 port map(A_1, B_1, S_gm);
	testbench : tb_val_2 port map(A_1, B_1, S_dut, S_gm);

end top_module_arch;
