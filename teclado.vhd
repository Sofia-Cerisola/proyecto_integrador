library IEEE;
use IEEE.std_logic_1164.all;
use work.anti_rebote_pkg.all;
use work.decod_tec_pkg.all;
use work.div_frec_pkg.all;

entity teclado is
    port (
        clk         : in std_logic;
        fil         : out std_logic_vector (3 downto 0);
        col         : in std_logic_vector (3 downto 0);
        teclas      : out integer;
        tiempo      : out std_logic);
end teclado;

architecture teclado_mat of teclado is

    signal frec_reg, frec_ar, flag : std_logic;  --frecuencias reducidas (registro y anti rebote) y banderas de guardado

    signal reg : std_logic_vector (3 downto 0) := "0001";  --fila (registro)
    signal bcd, cl : std_logic_vector (3 downto 0); --numero bcd, columna limpia
    signal col_fil : std_logic_vector (6 downto 0);  -- combinacion de columna y fila
begin
    
end teclado_mat;