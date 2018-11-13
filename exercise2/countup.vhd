library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COUNT is
    port (
        CLK : in std_logic;
        RSTN: in std_logic;
        ENABLE: in std_logic;
        TENS : out std_logic_vector(2 downto 0); 
        ONES : out std_logic_vector(3 downto 0));
end COUNT;

architecture RTL of COUNT is
    signal VAL1 : std_logic_vector(3 downto 0);
    signal VAL2 : std_logic_vector(2 downto 0);

begin
    process (CLK, RSTN) begin
        if (RSTN ='0') then
            VAL1 <= "0000";
            VAL2 <= "000";
        elsif(CLK 'event and CLK = '1') then
	        if(ENABLE = '1') then
                if(VAL1 >= "1001") then
                    VAL1 <= "0000";
                    VAL2 <= VAL2 + 1;
                    if(VAL2 >= "101") then
                        VAL2 <= "000";
                    end if;
                else
                    VAL1 <= VAL1 + 1;
                end if;
            end if;
        end if;
    end process;
    
    ONES <= VAL1;
    TENS <= VAL2;
end RTL;
