library ieee;
use ieee.std_logic_1164.all;
use work.led_matrix.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TBGATE is
end TBGATE;

architecture TESTBENCH of TBGATE is
    component USER
        port(
            CLK       : in std_logic;
            RSTN      : in std_logic;
            CHGN      : in std_logic;
            GRID      : out std_matrix);
    end component;
    signal TB_CLK, TB_RSTN : std_logic;
    signal TB_CHGN : std_logic;
    signal TB_GRID         : std_matrix := ((0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0),
                                            (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3));

begin
    i0 : USER port map(CLK=>TB_CLK, RSTN=>TB_RSTN, CHGN=>TB_CHGN, GRID=>TB_GRID);
    
    process begin
        TB_RSTN <= '0'; TB_CLK <= '1'; wait for CLK_CYCLE;
        TB_RSTN <= '1'; TB_CLK <= '0'; wait for CLK_CYCLE;
        for ii in 0 to 30 loop
            TB_CHGN <= '1'; wait for CLK_CYCLE;
            TB_CHGN <= '0'; wait for CLK_CYCLE;
        end loop;
        wait;
    end process;

--    process begin
--        TB_RSTN <= '0'; TB_CLK <= '1'; wait for CLK_CYCLE;
--        TB_X <= "1000"; wait for CLK_CYCLE/2;
--        TB_X <= "0000"; wait;
--    end process;

end TESTBENCH;

configuration CFG_TBGATE of TBGATE is
    for TESTBENCH
        for i0: USER
        end for;
    end for;
end;

