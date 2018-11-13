library ieee;
use ieee.std_logic_1164.all;

entity KADAI2 is
    port (
        CLK   : in std_logic;
        RSTN  : in std_logic;
        STARTN: in std_logic;
        STOPN : in std_logic;
        LEDH  : out std_logic_vector(6 downto 0);
        LEDL  : out std_logic_vector(6 downto 0));
end KADAI2;

architecture RTL of KADAI2 is 
    component RATE
        port (
            CLK   : in std_logic;
            RSTN  : in std_logic;
            ENABLE: out std_logic);
    end component;
    component COUNT
        port (
            CLK   : in std_logic;
            RSTN  : in std_logic;
            ENABLE: in std_logic;
            TENS  : out std_logic_vector(2 downto 0);
            ONES  : out std_logic_vector(3 downto 0));
    end component;
    component DECODER
        port( 
            ONES : in std_logic_vector(3 downto 0);
            TENS : in std_logic_vector(2 downto 0);
            LEDL : out std_logic_vector(6 downto 0);
            LEDH : out std_logic_vector(6 downto 0));
    end component;
    component ONESHOT
	    port (
        CLK, RSTN : in std_logic;
        SW        : in std_logic;
        SWONE     : out std_logic);
    end component;

    signal FLAG : std_logic;
    signal SWONE: std_logic;
    signal ENABLE : std_logic;
    signal SWITCH : std_logic := '0';
    signal TENS: std_logic_vector(2 downto 0);
    signal ONES: std_logic_vector(3 downto 0);

begin
    i0: RATE port map( CLK=>CLK, RSTN=>RSTN, ENABLE=>FLAG);
    ENABLE <= FLAG and SWITCH;
	 --i0: RATE port map( CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE);
    i1: COUNT port map(CLK=>CLK, RSTN=>RSTN, ENABLE=>ENABLE, TENS=>TENS, ONES=>ONES);
    i2: DECODER port map(ONES=>ONES, TENS=>TENS, LEDL=>LEDL, LEDH=>LEDH);
    i3: ONESHOT port map(CLK=>CLK, RSTN=>RSTN, SW=>STARTN, SWONE=>SWONE);
     
    process(CLK) begin
        if(CLK'event and CLK='1') then
            if(SWONE = '0' and SWITCH = '0') then
                    SWITCH <= '1';
            elsif(SWONE = '0' and SWITCH = '1') then
                SWITCH <= '0';
                end if;
        end if;
	 end process; 
	 
end;
