library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.led_matrix.all;

entity MULTIPLEXER is
    port(
        CLK       : in std_logic;
        RSTN      : in std_logic;
        ENABLE    : in std_logic;
        GRID      : in std_matrix;
        LED_OUT   : out std_logic_vector(3 downto 0);
        LED_INDEX : out integer);
end MULTIPLEXER;

architecture RTL of MULTIPLEXER is
    constant RESET : std_logic_vector(3 downto 0) := "0000";
    signal LED_ROW : std_logic_vector(3 downto 0);
    signal INDEX   : integer := 4; 
    
    begin
        LED_INDEX <= INDEX;
        LED_OUT <= LED_ROW;

        process(INDEX) begin
            if(INDEX < 4) then
                LED_ROW <= GRID(INDEX);
            else
                LED_ROW <= RESET;
            end if;
        end process;
 
        process(CLK, RSTN) begin
            if(RSTN = '0') then
                INDEX <= 4;
            elsif(CLK 'event and CLK = '1') then
                if(ENABLE = '1') then
                    INDEX <= INDEX - 1;
                    if (INDEX = 0) then
                        INDEX <= 3;
                    end if;
                end if;
            end if;
        end process;

end RTL;
        
