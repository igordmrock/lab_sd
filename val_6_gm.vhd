library ieee;
use ieee.std_logic_1164.all;

entity val_6_gm is
port(
	D, CLK, CLR : in std_logic;
	Q : out std_logic
);
end val_6_gm;

architecture flipflopD_arch of val_6_gm is
begin
process(CLR, CLK)
begin
	if CLR = '1' then Q <= '0';
	elsif rising_edge(CLK) then Q <= D;
	end if;
end process;
end flipflopD_arch;
