library ieee;
use ieee.std_logic_1164.all;

entity flipflop_JK is
port(
	JK : in std_logic_vector(1 downto 0);
	PR, CLR, CLK : in std_logic;
	Q : out std_logic
);
end flipflop_JK;

architecture flipflop_JK_arch of flipflop_JK is
signal Qbuf : std_logic;
begin
	process(PR, CLR, CLK)
	begin
		if PR = '1' then Qbuf <= '1';
		elsif CLR = '1' then Qbuf <= '0';
		elsif rising_edge(CLK) then
			case JK is
				when "00" => Qbuf <= Qbuf;
				when "01" => Qbuf <= '0';
				when "10" => Qbuf <= '1';
				when "11" => Qbuf <= not(Qbuf);
				when others => Qbuf <= Qbuf;
			end case;
		end if;
	end process;
Q <= Qbuf;
end flipflop_JK_arch;