library ieee;
use ieee.std_logic_1164.all;
use work.led_matrix.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEMESTER_PROJECT is
    port(
        CLK    : in std_logic;
        RSTN   : in std_logic;
        LED_HIGH : out std_logic_vector(15 downto 0);
        LED_LOW  : out std_logic_vector(15 downto 0);
		  LED_LOW2   : out std_logic_vector(15 downto 0));
end SEMESTER_PROJECT;

architecture RTL of SEMESTER_PROJECT is
    component VISUALIZE
        port(
            CLK       : in std_logic;
            RSTN      : in std_logic;
            GRID      : in std_matrix;
            LED_HIGH  : out std_logic_vector(15 downto 0);
--            LED_GND   : out std_logic_vector(15 downto 0));
            LED_GND1   : out std_logic_vector(15 downto 0);
				LED_GND2   : out std_logic_vector(15 downto 0));
    end component;
    signal TB_GRID         : std_matrix := ((1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	                                         (0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
														  (0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),
														  (0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0),
														  (0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0),
														  (0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0),
														  (0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
														  (0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
														  (0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0),
														  (0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0),
														  (0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0),
														  (0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
														  (0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0),
														  (0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,0),
														  (0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0),
														  (0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1));
														  

begin
    i0: VISUALIZE port map(CLK=>CLK, RSTN=>RSTN, GRID=>TB_GRID, LED_HIGH=>LED_HIGH, LED_GND1=>LED_LOW, LED_GND2=>LED_LOW2);
    --i0: VISUALIZE port map(CLK=>CLK, RSTN=>RSTN, GRID=>TB_GRID, LED_HIGH=>LED_HIGH, LED_GND=>LED_LOW);

end RTL;


