library ieee;
use ieee.std_logic_1164.all;

entity maquina_refri is
port(
	A : in std_logic_vector(1 downto 0);
	CLK, RST : in std_logic;
	D25, D50, REFRI : out std_logic
);
end maquina_refri;

architecture maquina_arch of maquina_refri is

type estado is (STinicial, ST25, ST50, ST75, ST100, ST125, STCancela25, STCancela50, STCancela75);

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
D25 <= '0'; D50 <= '0'; REFRI <= '0';

case estado_atual is
	when STinicial => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;

	when ST25 => case A is
			when "00" => proximo_estado <= ST25;
			when "01" => proximo_estado <= ST50;
			when "10" => proximo_estado <= ST75;
			when others => proximo_estado <= STCancela25;
		end case;

	when ST50 => case A is
			when "00" => proximo_estado <= ST50;
			when "01" => proximo_estado <= ST75;
			when "10" => proximo_estado <= ST100;
			when others => proximo_estado <= STCancela50;
		end case;

	when ST75 => case A is
			when "00" => proximo_estado <= ST75;
			when "01" => proximo_estado <= ST100;
			when "10" => proximo_estado <= ST125;
			when others => proximo_estado <= STCancela75;
		end case;

	when ST100 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		REFRI <= '1';

	when ST125 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		REFRI <= '1'; D25 <= '1';

	when STCancela25 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		D25 <= '1';

	when STCancela50 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		D50 <= '1';

	when STCancela75 => case A is
			when "00" => proximo_estado <= STinicial;
			when "01" => proximo_estado <= ST25;
			when "10" => proximo_estado <= ST50;
			when others => proximo_estado <= STinicial;
		end case;
		D25 <= '1'; D50 <= '1';

end case;
end process;
end maquina_arch;
