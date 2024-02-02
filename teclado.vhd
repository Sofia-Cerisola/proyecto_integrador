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
        teclas      : out integer);
end teclado;

architecture teclado_mat of teclado is

    signal frec_reg, frec_ar, flag : std_logic;  --frecuencias reducidas (registro y anti rebote) y banderas de guardado

    signal reg     : std_logic_vector (3 downto 0) := "0001";  --fila (registro)
    signal bcd, cl : std_logic_vector (3 downto 0);  --numero bcd, columna limpia
    signal col_fil : std_logic_vector (6 downto 0);  -- combinacion de columna y fila

begin

    -- Inicio de los divisores de frecuencia
    df1 : div_frec port map (
        clk      => clk,
        n_ciclos => 125000, --cambiar despues los numeros por una constante
        frec     => frec_reg
    );

    df1 : div_frec port map (
        clk      => clk,
        n_ciclos => 10000, --cambiar despues los numeros por una constante
        frec     => frec_ar
    );
    --  Determinar el numero de ciclos a partir del reloj de la fpga

    -- Anti rebote
    for i in 0 to 3 generate
        anti_reb : anti_rebote port map (
            clk     => frec_ar,
            pul_in  => col(i),
            pul_out => cl(i)
        );
    end generate;

    -- Registro de desplazamiento
    process (frec_reg, flag)
    begin
        if rising_edge(frec_reg) then
            reg  <= reg(0) & reg(3 downto 1);
        end if;
    end process;

    -- Memoria de salida
    process (frec_reg, flag)
    begin
        flag <= cl(0) or cl(1) or cl(2) or cl(3);

        if rising_edge(flag) then
            col_fil <= col & reg;
        end if;
    end process;

    -- Selector
    with col_fil select bcd <=
        "0000" when "0100001",
        "0001" when "1001000",
        "0010" when "0101000",
        "0011" when "0011000",
        "0100" when "1000100",
        "0101" when "0100100",
        "0110" when "0010100",
        "0111" when "1000010",
        "1000" when "0100010",
        "1001" when "0010010",
        "1010" when "1000001",
        "1011" when "0010001",
        "ZZZZ" when others;
    
    -- Decodificacion
    decod : decod_tec port map (
        bcd    => bcd,
        teclas => teclas
    );
    
    --salida
    fil <= reg;

end teclado_mat;