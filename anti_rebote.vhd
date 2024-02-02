library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package anti_rebote_pkg is
    component anti_rebote is
        port(
            clk : in std_logic;
            pul_in : in std_logic;
            pul_out : out std_logic);
    end component;
end package;

library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity anti_rebote is
    port(
        clk     : in std_logic;
        pul_in  : in std_logic;    --Pulso de entrada
        pul_out : out std_logic);  -- Pulso de salida limpio

end anti_rebote;

architecture registro of anti_rebote is
    signal reg : std_logic_vector (7 downto 0); 
begin
    
    process(pul_in, clk)
    begin
        if rising_edge(clk) then
            reg <= reg(6 downto 0) & pul_in;
        end if;

        if reg = x"FF" then
            pul_out <= '1';
        else
            pul_out <= '0';
        end if;
    end process;

end registro;