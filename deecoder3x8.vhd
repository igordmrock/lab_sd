library ieee;
use ieee.std_logic_1164.all;

entity decoder3x8 is
	port (A : in std_logic_vector(2 downto 0);
	      Y : out std_logic_vector(7 downto 0));
end decoder3x8;

architecture rtl of decoder3x8 is
begin
	with A select
	Y <=    x"01" when "000",
		x"02" when "001",
		x"04" when "010",
		x"08" when "011",
		x"10" when "100",
		x"20" when "101",
		x"40" when "110",
	 	x"80" when "111",
	 	x"00" when others;
end rtl;
