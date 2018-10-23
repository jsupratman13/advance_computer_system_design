library ieee;
use ieee.std_logic_1164.all;

entity HIGH3 is 
    port (
        A, B, C : in std_logic; 
        Y : out std_logic);
end HIGH3;

architecture RTL of HIGH3 is
begin
    Y <= ((B and C) or A);
end RTL;


