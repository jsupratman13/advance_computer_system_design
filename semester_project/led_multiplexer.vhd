library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.led_matrix.all;

entity LED_MULTIPLEXER is
    port(
        CLK       : in std_logic;
        RSTN      : in std_logic;
        ENABLE    : in std_logic;
        GRID      : in std_matrix;
        LED_OUT1  : out std_logic_vector(15 downto 0);
        LED_OUT2  : out std_logic_vector(15 downto 0);
        LED_INDEX : out integer);
end LED_MULTIPLEXER;

architecture RTL of LED_MULTIPLEXER is
    constant RESET  : std_logic_vector(15 downto 0) := "0000000000000000";
    signal LED_ROW1 : std_logic_vector(15 downto 0);
    signal LED_ROW2 : std_logic_vector(15 downto 0);
    signal INDEX    : integer := 16; 
    
    begin
        LED_INDEX <= INDEX;
        LED_OUT1 <= LED_ROW1;
        LED_OUT2 <= LED_ROW2;
        
        process(INDEX) begin
            if(INDEX < 16) then
                for i in 15 downto 0 loop
                    if(GRID(INDEX, i) = 1) then
                        LED_ROW1(i) <= '1';
                        LED_ROW2(i) <= '0';
                    elsif(GRID(INDEX, i) = 2) then
                        LED_ROW1(i) <= '0';
                        LED_ROW2(i) <= '1';
                    elsif(GRID(INDEX, i) = 3) then
                        LED_ROW1(i) <= '1';
                        LED_ROW2(i) <= '1';
                    else
                        LED_ROW1(i) <= '0';
                        LED_ROW2(i) <= '0';
                    end if;
                end loop;
                --LED_ROW <= GRID(INDEX);
            else
                LED_ROW1 <= RESET;
                LED_ROW2 <= RESET;
            end if;
        end process;
 
        process(CLK, RSTN) begin
            if(RSTN = '0') then
                INDEX <= 16;
            elsif(CLK 'event and CLK = '1') then
                if(ENABLE = '1') then
                    INDEX <= INDEX - 1;
                    if (INDEX = 0) then
                        INDEX <= 15;
                    end if;
                end if;
            end if;
        end process;

end RTL;
        
