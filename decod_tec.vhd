library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package decod_tec_pkg is
    component decod_tec is
        port(
            bcd    : in std_logic_vector (3 downto 0);
            teclas : out integer);
    end component;
end package;

library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decod_tec is
    port(
        bcd    : in std_logic_vector (3 downto 0);
        teclas : out integer);
end decod_tec;

architecture decodificador of decod_tec is 
begin
end decodificador;