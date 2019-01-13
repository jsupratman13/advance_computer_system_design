library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DECODER is 
    port (
        LED_IN    : in std_logic_vector(15 downto 0);
        LED_INDEX : in integer;
        LED_HIGH  : out std_logic_vector(15 downto 0);
        LED_GND   : out std_logic_vector(15 downto 0));
end DECODER;

architecture RTL of DECODER is
begin
    LED_HIGH <= LED_IN;
    process (LED_INDEX) begin
        case LED_INDEX is
            when 15 => LED_GND <= "1000000000000000";
            when 14 => LED_GND <= "0100000000000000";
            when 13 => LED_GND <= "0010000000000000";
            when 12 => LED_GND <= "0001000000000000";
            when 11 => LED_GND <= "0000100000000000";
            when 10 => LED_GND <= "0000010000000000";
            when  9 => LED_GND <= "0000001000000000";
            when  8 => LED_GND <= "0000000100000000";
            when  7 => LED_GND <= "0000000010000000";
            when  6 => LED_GND <= "0000000001000000";
            when  5 => LED_GND <= "0000000000100000";
            when  4 => LED_GND <= "0000000000010000";
            when  3 => LED_GND <= "0000000000001000";
            when  2 => LED_GND <= "0000000000000100";
            when  1 => LED_GND <= "0000000000000010";
            when  0 => LED_GND <= "0000000000000001";
            when others => LED_GND <= "0000000000000000";
        end case;
    end process;
end RTL;
