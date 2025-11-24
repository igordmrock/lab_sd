library ieee;
use ieee.std_logic_1164.all;

entity val_7_tb is
end val_7_tb;

architecture behavior of val_7_tb is

component val_7 is
port(
	A : in std_logic_vector(1 downto 0);
	CLK, RST : in std_logic;
	D50, REFRI : out std_logic
);
end component;

signal A_1 : std_logic_vector(1 downto 0) := "00";
signal CLK_1 : std_logic := '0';
signal RST_1 : std_logic := '0';
signal D_50, REFRI_1 : std_logic;

begin
maquina : val_7 port map(A_1, CLK_1, RST_1, D_50, REFRI_1);

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


-- Testando a sequência de estados: Inicial -> ST50 -> ST100:
A_1 <= "10";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;


-- ST100 -> Inicial -> ST50 -> STCancela50
A_1 <= "00";
wait for 10 ns;

A_1 <= "10";
wait for 10 ns;

A_1 <= "11";
wait for 10 ns;


-- STCancel50 -> Inicial -> ST50 -> ST100
A_1 <= "00";
wait for 10 ns;

A_1 <= "01";
wait for 10 ns;

A_1 <= "01";
wait for 10 ns;

A_1 <= "00";
wait for 10 ns;

end process;
end behavior;
