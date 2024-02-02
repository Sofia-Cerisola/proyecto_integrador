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

    with bcd select teclas <=
        0 when "0000",
        1 when "0001",
        2 when "0010",
        3 when "0011",
        4 when "0100",
        5 when "0101",
        6 when "0110",
        7 when "0111",
        8 when "1000",
        9 when "1001",
        "" when "1010",
        "" when "1011",

end decodificador;