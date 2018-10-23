library ieee;
use ieee.std_logic_1164.all;

entity DECODER is 
    port (
        ONES : in std_logic_vector(3 downto 0);
        TENS : in std_logic_vector(2 downto 0);
        LEDL : out std_logic_vector(6 downto 0);
        LEDH : out std_logic_vector(6 downto 0));
end DECODER;

architecture RTL of DECODER is
begin
    process (ONES, TENS) begin
        case TENS is
            when  "000" => LEDH <= "1000000";
            when  "001" => LEDH <= "1111001";
            when  "010" => LEDH <= "0100100";
            when  "011" => LEDH <= "0011000";
            when  "100" => LEDH <= "0011001";
            when  "101" => LEDH <= "0010010";
            when  "110" => LEDH <= "0000010";
            when others => LEDH <= "0000000";
        end case;

        case ONES is
            when "0000" => LEDL <= "1000000";
            when "0001" => LEDL <= "1111001";
            when "0010" => LEDL <= "0100100";
            when "0011" => LEDL <= "0110000";
            when "0100" => LEDL <= "0011001";
            when "0101" => LEDL <= "0010010";
            when "0110" => LEDL <= "0000010";
            when "0111" => LEDL <= "1011000";
            when "1000" => LEDL <= "0000000";
            when "1001" => LEDL <= "0010000";
            when others => LEDL <= "0000000";
        end case;
    end process;
end RTL;
