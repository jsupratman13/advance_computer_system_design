library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DECODER is 
    port (
        LED_IN    : in std_logic_vector(3 downto 0);
        LED_INDEX : in integer;
        LED_HIGH  : out std_logic_vector(3 downto 0);
        LED_GND   : out std_logic_vector(3 downto 0));
end DECODER;

architecture RTL of DECODER is
begin
    LED_HIGH <= LED_IN;
    process (LED_INDEX) begin
        case LED_INDEX is
            when  3 => LED_GND <= "1000";
            when  2 => LED_GND <= "0100";
            when  1 => LED_GND <= "0010";
            when  0 => LED_GND <= "0001";
            when others => LED_GND <= "0000";
        end case;
    end process;
end RTL;
