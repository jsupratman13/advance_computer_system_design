library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.led_matrix.all;

entity USER is
    port(
        CLK       : in std_logic;
        RSTN      : in std_logic;
        CHGN      : in std_logic;
        GRID      : out std_matrix);
end USER;

architecture RTL of USER is
    component ONESHOT
        port(
            CLK    : in std_logic;
            RSTN   : in std_logic;
            SW     : in std_logic;
            SWONE  : out std_logic);
    end component;
    component ART
        port(
            FLAG      : in integer;
            GRID      : out std_matrix);
    end component;

    signal CHGNONE : std_logic;
    signal FLAG    : integer := 0;

    begin
        --i0: ONESHOT port map(CLK=>CLK, RSTN=>RSTN, SW=>CHGN, SWONE=>CHGNONE);
        i1: ART port map(FLAG=>FLAG, GRID=>GRID);

        process(CLK) begin
            if(CLK'event and CLK='1') then
                if(CHGN = '0') then
                    FLAG <= FLAG + 1;
                    if (FLAG = 2) then
                        FLAG <= 0;
                    end if;
                end if;
            end if;
        end process;

end RTL;
        
