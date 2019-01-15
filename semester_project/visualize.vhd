library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.led_matrix.all;

entity VISUALIZE is
    port(
        CLK       : in std_logic;
        RSTN      : in std_logic;
        GRID      : in std_matrix;
        LED_HIGH  : out std_logic_vector(15 downto 0);
        LED_GND1  : out std_logic_vector(15 downto 0);
        LED_GND2  : out std_logic_vector(15 downto 0));
end VISUALIZE;

architecture RTL of VISUALIZE is
    component LED_MULTIPLEXER
        port(
            CLK       : in std_logic;
            RSTN      : in std_logic;
            ENABLE    : in std_logic;
            GRID      : in std_matrix;
            LED_OUT1  : out std_logic_vector(15 downto 0);
            LED_OUT2  : out std_logic_vector(15 downto 0);
            LED_INDEX : out integer);
    end component;
   
    component COLOR_RATE
        port(
            CLK    : in std_logic;
            RSTN   : in std_logic;
            ENABLE : out std_logic);
    end component;
    
    component LED_RATE
        port(
            CLK    : in std_logic;
            RSTN   : in std_logic;
            ENABLE : out std_logic);
    end component;
     
    component COLOR_MULTIPLEXER
        port(
            CLK       : in std_logic;
            RSTN      : in std_logic;
            ENABLE    : in std_logic;
            LED_IN1   : in std_logic_vector(15 downto 0);
            LED_IN2   : in std_logic_vector(15 downto 0);
            LED_OUT1  : out std_logic_vector(15 downto 0);
            LED_OUT2  : out std_logic_vector(15 downto 0));
    end component;
     
    component DECODER
        port(
            LED_IN1   : in std_logic_vector(15 downto 0);
            LED_IN2   : in std_logic_vector(15 downto 0);
            LED_INDEX : in integer;
            LED_HIGH  : out std_logic_vector(15 downto 0);
            LED_GND1  : out std_logic_vector(15 downto 0);
            LED_GND2  : out std_logic_vector(15 downto 0));
    end component;
    
    signal ENABLE_LED : std_logic;
    signal ENABLE_COLOR : std_logic;
    signal OUT1 : std_logic_vector(15 downto 0);
    signal OUT2 : std_logic_vector(15 downto 0);
    signal LED_OUT1 : std_logic_vector(15 downto 0);
    signal LED_OUT2 : std_logic_vector(15 downto 0);
    signal LED_INDEX : integer := 15;

    begin
        i0 : LED_RATE port map(CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE_LED);
        i3 : COLOR_RATE port map(CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE_COLOR);  
        i1 : LED_MULTIPLEXER port map(CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE_LED, GRID=>GRID, LED_OUT1=>OUT1, LED_OUT2=>OUT2, LED_INDEX=>LED_INDEX);
        i4 : COLOR_MULTIPLEXER port map(CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE_COLOR, LED_IN1=>OUT1, LED_IN2=>OUT2, LED_OUT1=>LED_OUT1, LED_OUT2=>LED_OUT2);
        i2 : DECODER port map(LED_IN1=>LED_OUT1, LED_IN2=>LED_OUT2, LED_INDEX=>LED_INDEX, LED_HIGH=>LED_HIGH, LED_GND1=>LED_GND1, LED_GND2=>LED_GND2);

end RTL;
        
