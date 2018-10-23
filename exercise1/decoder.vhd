library ieee;
use ieee.std_logic_1164.all;

entity DECODER is 
    port (
        DATA : in std_logic;
        LEDDSP : out std_logic_vector(6 downto 0) );
end DECODER;

architecture RTL of DECODER is
begin
    process (DATA) begin
        case DATA is
            when    '0' => LEDDSP <= "1000111";
            when    '1' => LEDDSP <= "0001001";
            when others => LEDDSP <= "0000000";
        end case;
    end process;
end RTL;
