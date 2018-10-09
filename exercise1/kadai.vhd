library ieee;
use ieee.std_logic_1164.all;

entity KADAI1 is 
    port (
        X: in std_logic_vector(2 downto 0 );
        Y: out std_logic_vector(6 downto 0 );
end KADAI1;

architecture RTL of KADAI1 is
    component HIGH3
        port (
            A, B, C: in std_logic;
            Y : out std_logic);
    end component;
    component DECODER
        port ( 
            DATA : in std_logic;
            LEDDSP : out std_logic_vector(6 downto 0) );
    end component;
    signal TEMP : std_logic_vector(2 downto 0);
    signal w0 : std_logic;
begin
    TEMP(2) <= not X(2);
    TEMP(1) <= not X(1);
    TEMP(0) <= not X(0);

    i0: HIGH3 port map (
        A=>TEMP(2), B=>TEMP(1), C=>TEMP(0), Y=>w0 );

    i1: DECODER port map (
        DATA=>w0, LEDDSP=>Y );

end RTL;
