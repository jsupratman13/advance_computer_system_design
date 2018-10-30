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

begin
    i0: KADA2 port map(CLK=>TB_IN(3), RSTN=>TB_IN(2), STARTN=>TB_IN(1), STOPN=>TB_IN(0), LEDH=>TB_OUT1, LEDL=>TB_OUT2);
    
    process begin
        TB_IN <= "1111"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
        TB_IN <= "1011"; wait for 100 ns;
    end process;

end TESTBENCH;

configuration CFG_TBGATE of TBGATE is
    for TESTBENCH
        for i1: KADAI2
        end for;
    end for;
end;

