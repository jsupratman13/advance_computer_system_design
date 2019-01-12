library ieee;
use ieee.std_logic_1164.all;

PACKAGE led_matrix IS
    --type std_matrix is array (3 downto 0, 3 downto 0) of std_logic;
    type std_matrix is array (3 downto 0) of std_logic_vector(3 downto 0);
END led_matrix;
