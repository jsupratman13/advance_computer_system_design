library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.led_matrix.all;

entity COLOR_SWITCH is
    port(
        CLK       : in std_logic;
        RSTN      : in std_logic;
        ENABLE    : in std_logic;
        LED_IN1   : in std_logic_vector(15 downto 0);
        LED_IN2   : in std_logic_vector(15 downto 0);
        LED_OUT1 : out std_logic_vector(15 downto 0);
        LED_OUT2 : out std_logic_vector(15 downto 0));
end COLOR_SWITCH;

architecture RTL of COLOR_SWITCH is
    constant RESET : std_logic_vector(15 downto 0) := "0000000000000000";
    signal LED_ROW1 : std_logic_vector(15 downto 0);
    signal LED_ROW2 : std_logic_vector(15 downto 0);
    signal FLAG   : std_logic := '0';
    
    begin
        LED_OUT1 <= LED_ROW1;
        LED_OUT2 <= LED_ROW2;
        
        process(FLAG) begin
            if(FLAG = '1') then
                LED_ROW1 <= LED_IN1;
                LED_ROW2 <= RESET;
            elsif(FLAG = '0') then
                LED_ROW1 <= RESET;
                LED_ROW2 <= LED_IN2;
            else
                LED_ROW1 <= RESET;
                LED_ROW2 <= RESET;
            end if;
        end process;
 
        process(CLK, RSTN) begin
            if(RSTN = '0') then
                FLAG <= '0';
            elsif(CLK 'event and CLK = '1') then
                if(ENABLE = '1') then
                    if(FLAG = '0') then
                        FLAG <= '1';
                    else
                        FLAG <= '0';
                    end if;
                end if;
            end if;
        end process;

end RTL;
        
