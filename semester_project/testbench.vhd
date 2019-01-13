library ieee;
use ieee.std_logic_1164.all;
use work.led_matrix.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TBGATE is
end TBGATE;

architecture TESTBENCH of TBGATE is
    component VISUALIZE
        port(
            CLK       : in std_logic;
            RSTN      : in std_logic;
            GRID      : in std_matrix;
            LED_HIGH  : out std_logic_vector(15 downto 0);
            LED_GND1  : out std_logic_vector(15 downto 0);
            LED_GND2  : out std_logic_vector(15 downto 0));
    end component;
    signal TB_CLK, TB_RSTN : std_logic;
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
    signal TB_HIGH, TB_GND1, TB_GND2 : std_logic_vector(15 downto 0);
    constant CLK_CYCLE: time := 100 ns;

begin
    i0: VISUALIZE port map(CLK=>TB_CLK, RSTN=>TB_RSTN, GRID=>TB_GRID, LED_HIGH=>TB_HIGH, LED_GND1=>TB_GND1, LED_GND2=>TB_GND2);
    
    process begin
        TB_RSTN <= '0'; TB_CLK <= '1'; wait for CLK_CYCLE;
        TB_RSTN <= '1'; TB_CLK <= '0'; wait for CLK_CYCLE;
        for ii in 0 to 30 loop
            TB_CLK <= '1'; wait for CLK_CYCLE;
            TB_CLK <= '0'; wait for CLK_CYCLE;
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
        for i0: VISUALIZE
        end for;
    end for;
end;

