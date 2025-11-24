library ieee;
use ieee.std_logic_1164.all;

entity val_7 is
port(
	A : in std_logic_vector(1 downto 0);
	CLK, RST : in std_logic;
	D50, REFRI : out std_logic
);
end val_7;

architecture maquina_arch of val_7 is

type estado is (STinicial, ST50, ST100, STCancela50);

signal estado_atual : estado := STinicial;
signal proximo_estado : estado;

begin
sync_proc : process(CLK, RST)
begin
	if (RST = '1') then
		estado_atual <= STinicial;
	elsif rising_edge(CLK) then
		estado_atual <= proximo_estado;
	end if;
end process sync_proc;

comb_proc : process(estado_atual, A)
begin
D50 <= '0'; REFRI <= '0';

case estado_atual is
	when STinicial => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" | "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;


	when ST50 => case A is
			when "00" => proximo_estado <= ST50;
			when "01" | "10" => proximo_estado <= ST100;
			when others => proximo_estado <= STCancela50;
		end case;


	when ST100 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" | "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		REFRI <= '1';


	when STCancela50 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" | "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		D50 <= '1';
end case;
end process;
end maquina_arch;
