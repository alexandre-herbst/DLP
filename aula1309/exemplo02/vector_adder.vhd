---------------------------
-- FILE vector_adder.vhd --
---------------------------
library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_pkg.all;
 
entity vector_adder is
	generic (N : natural := 4);
	port (
		a	  : in a_slv (0 to N-1);
		soma : out std_logic_vector (3 downto 0));
end entity;
 
-- Versão que realiza a soma diretamente, mas que precisa modificar o código de acordo com o número de entradas.
 
architecture ifsc_v1 of vector_adder is
	signal soma_sig : signed(3 downto 0);
begin
	soma_sig <= signed(a(0)) + signed(a(1)) + signed(a(2)) +  signed(a(3));
	soma <= std_logic_vector(soma_sig);
end architecture;
 
-- Versão que realiza a soma usando um FOR GENERATE
architecture ifsc_v2 of vector_adder is
 signal fio : a_sig(0 to N-1);
begin
fio(0) <= signed (a(0));
 loopsoma : for i in 1 to N-1 generate
 fio (i) <= signed(a(i)) + fio (i - 1);
 end generate;
 soma <= std_logic_vector(fio(N-1));
end architecture;