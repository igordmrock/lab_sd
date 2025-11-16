library ieee;
use ieee.std_logic_1164.all;

entity val_6_tb is
	port(
		Qdut, Qgm : in std_logic;
		D, CLR, CLK : out std_logic
	);
end val_6_tb;


architecture behavior of val_6_tb is
begin
process
	variable CLK_1, D_1 : std_logic := '0';
	variable CLR_1 : std_logic := '1';
begin  
	for i in 0 to 1 loop 
        	CLR <= CLR_1;

        	for j in 0 to 1 loop
  	        	D <= D_1;
		
			for k in 0 to 1 loop
				CLK <= CLK_1;
				wait for 10 ns;
				CLK_1 := not(CLK_1);
        		end loop;
		
			D_1 := not(D_1);
       		end loop;
		CLR_1 := not(CLR_1);
	end loop;
	wait;
end process;
end behavior;