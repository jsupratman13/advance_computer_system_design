library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COLOR_RATE is
    port(
        CLK : in std_logic;
        RSTN : in std_logic;
        ENABLE : out std_logic);
end COLOR_RATE;

architecture RTL of COLOR_RATE is
    signal COUNT : std_logic_vector(25 downto 0);
    constant MAXCOUNT : std_logic_vector(25 downto 0)
--                      := "00000000011000011010100000"; --100KHz
--                      := "00000000000010011100010000"; --10KHz
                      := "00000000000001001110001000"; --5KHz
--                        := "00000000000000001111101000";  --1KHz
--                      := "00000000000000000000000010"; --simulator
    constant ZEROCOUNT: std_logic_vector(25 downto 0)
                      := "00000000000000000000000000";

begin
    process (CLK, RSTN) begin
        if (RSTN = '0') then
            COUNT <= MAXCOUNT;
            ENABLE <= '0';
        elsif (CLK 'event and CLK = '1') then
            if(COUNT = ZEROCOUNT) then
                COUNT <= MAXCOUNT;
                ENABLE <= '1';
            else
                COUNT <= COUNT - 1;
                ENABLE <= '0';
            end if;
        end if;
    end process;
end RTL;

