library ieee;
use ieee.std_logic_1164.all;

entity maquina_refri_tb is
end maquina_refri_tb;

architecture behavior of maquina_refri_tb is

component maquina_refri is
port(
	A : in std_logic_vector(1 downto 0);
	CLK, RST : in std_logic;
	D25, D50, REFRI : out std_logic
);
end component;

signal A_1 : std_logic_vector(1 downto 0) := "00";
signal CLK_1 : std_logic := '0';
signal RST_1 : std_logic := '0';
signal D_25, D_50, REFRI_1 : std_logic;

begin
maquina : maquina_refri port map(A_1, CLK_1, RST_1, D_25, D_50, REFRI_1);

CLK_1 <= not(CLK_1) after 5 ns;

estimulo: process
begin

-- Testando o reset:
A_1 <= "10";
wait for 10 ns;

A_1 <= "00";
wait for 10 ns;

RST_1 <= '1';
wait for 10 ns;

RST_1 <= '0';
wait for 10 ns;


-- Testando a sequência de estados: Inicial -> ST25 -> ST50 -> ST75 -> ST100:
for i in 0 to 3 loop
	A_1 <= "01";
	wait for 10 ns;
end loop;


-- ST100 -> Inicial -> ST50 -> ST100
for i in 0 to 1 loop
	A_1 <= "10";
	wait for 10 ns;
end loop;


-- ST100 -> Inicial -> ST50 -> ST75 -> ST125
A_1 <= "00";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;

A_1 <= "01";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;


-- ST125 -> Inicial -> ST25 -> STCancela25
A_1 <= "00";
wait for 10 ns;

A_1 <= "01";
wait for 10 ns;

A_1 <= "11";
wait for 10 ns;


-- STCancel25 -> Inicial -> ST50 -> STCancela50
A_1 <= "00";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;

A_1 <= "11";
wait for 10 ns;


-- STCancel50 -> Inicial -> ST25 -> ST75 -> STCancela75 -> Inicial
A_1 <= "00";
wait for 10 ns;

A_1 <= "01";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;

A_1 <= "11";
wait for 10 ns;

A_1 <= "00";
wait for 10 ns;

end process;
end behavior;
