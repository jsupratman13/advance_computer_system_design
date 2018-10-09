library ieee;
use ieee.std_logic_1164.all;

entity KADAI1 is 
    port (
        PIN_U7, PIN_W9, PIN_M7 : in std_logic;
        PIN_U21, PIN_V21, PIN_W22, PIN_W21, PIN_Y22, PIN_Y21, PIN_AA22: out std_logic;
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
    TEMP(2) <= not PIN_U7;
    TEMP(1) <= not PIN_W9;
    TEMP(0) <= not PIN_M7;

    i0: HIGH3 port map (
        A=>TEMP(2), B=>TEMP(1), C=>TEMP(0) Y=>w0) );

    i1: DECODER port map (
        DATA=>w0, LEDDSP(6)=>PIN_AA22, LEDDSP(5)=>PIN_Y21, LEDDSP(4)=>PIN_Y22, LEDDSP(3)=>PIN_W21, LEDDSP(2)=>PIN_W22, LEDDSP(1)=>PIN_V21, LEDDSP(0)=>PIN_U21 );

end RTL;
