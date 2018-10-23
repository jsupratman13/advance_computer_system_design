library ieee;
use ieee.std_logic_1164.all;

entity TBGATE is
end TBGATE;

architecture TESTBENCH of TBGATE is
    component KADAI1
        port(
            X: in std_logic_vector(2 downto 0);
            Y: out std_logic_vector(6 downto 0));
    end component;
    signal TB_IN: std_logic_vector(2 downto 0);
    signal TB_OUT: std_logic_vector(6 downto 0);

begin
    U1: KADAI1 port map(
        X=>TB_IN, Y=>TB_OUT  );
    
    process begin
        TB_IN <= "000"; wait for 100 ns;
        TB_IN <= "001"; wait for 100 ns;
        TB_IN <= "010"; wait for 100 ns;
        TB_IN <= "011"; wait for 100 ns;
        TB_IN <= "100"; wait for 100 ns;
        TB_IN <= "101"; wait for 100 ns;
        TB_IN <= "110"; wait for 100 ns;
        TB_IN <= "111"; wait for 100 ns;
        TB_IN <= "000"; wait;
    end process;

end TESTBENCH;

configuration CFG_TBGATE of TBGATE is
    for TESTBENCH
        for U1: KADAI1
        end for;
    end for;
end;

