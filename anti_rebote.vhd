library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package anti_rebote_pkg is
    component anti_rebote is
        port(
            clk : in std_logic;
            btn : in std_logic;
            bto : out std_logic);
    end component;
end package;

library IEEE;
use IEEE.std_logic_1154.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity anti_rebote is
    port(
        clk : in std_logic;
        btn : in std_logic;
        bto : out std_logic);

end anti_rebote;

architecture registro of anti_rebote is
    signal reg : std_logic_vector (7 downto 0);
begin
    
    process(btn, clk)
    begin
        if rising_edge(clk) then
            reg <= reg(6 downto 0) & btn;
        end if;

        if reg = x"FF" then
            bto <= '1';
        else
            bto <= '1';
        end if;
    end process;

end registro;