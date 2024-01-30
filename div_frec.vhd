library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package div_frec_pkg is
    component div_frec is
        port(
        clk      : in std_logic;
        n_ciclos : in integer;
        frec     : out std_logic);
    end component;
end package;

library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity div_frec is
    port(
        clk      : in std_logic;
        n_ciclos : in integer;
        frec     : out std_logic);
end div_frec;

architecture divisor of div_frec is

    signal salida : std_logic;
    signal cuenta : integer range 0 to 25000000 := 0;
begin
    
    process(clk)
    begin
        if rising_edge(clk) then 
            if cuenta >= n_ciclos-1 then
                cuenta <= 0;
                salida <= not salida;
            else
                cuenta <= cuenta + 1;
            end if;
        end if;
    end process;

    frec <= salida;

end divisor;