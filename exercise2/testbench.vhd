library ieee;
use ieee.std_logic_1164.all;

entity TBGATE is
end TBGATE;

architecture TESTBENCH of TBGATE is
    component KADAI2
        port(
            CLK    : in std_logic;
            RSTN   : in std_logic;
            STARTN : in std_logic;
            STOPN  : in std_logic;
            LEDH   : out std_logic_vector(6 downto 0);
            LEDL   : out std_logic_vector(6 downto 0));
    end component;
    signal TB_IN  : std_logic_vector(3 downto 0);
    signal TB_OUT1: std_logic_vector(6 downto 0);
    signal TB_OUT2: std_logic_vector(6 downto 0);
    constant CLK_CYCLE: time := 100 ns;

begin
    i0: KADAI2 port map(CLK=>TB_IN(3), RSTN=>TB_IN(2), STARTN=>TB_IN(1), STOPN=>TB_IN(0), LEDH=>TB_OUT1, LEDL=>TB_OUT2);
    
    process begin
        TB_IN(0) <= '1'; TB_IN(1) <= '1'; TB_IN(2) <= '0'; wait for CLK_CYCLE;
        TB_IN(2) <= '1'; wait;
    end process;
    process begin
        TB_IN(3) <= '1'; wait for CLK_CYCLE/2;
        TB_IN(3) <= '0'; wait for CLK_CYCLE/2;
    end process;

end TESTBENCH;

configuration CFG_TBGATE of TBGATE is
    for TESTBENCH
        for i0: KADAI2
        end for;
    end for;
end;

