Top module:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk : in STD_LOGIC;
           JC : in STD_LOGIC_VECTOR(2 downto 0);
           vgaBlue : out STD_LOGIC_VECTOR(3 downto 0);
           vgaGreen : out STD_LOGIC_VECTOR(3 downto 0);
           vgaRed : out STD_LOGIC_VECTOR(3 downto 0);
           Hsync : out STD_LOGIC;
           Vsync : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0); --for 7 segment display
           an : out STD_LOGIC_VECTOR (3 downto 0)); --for 7 segment display  

end top_module;

architecture Behavioral of top_module is

signal Hp : integer;
signal Vp : integer;
signal PlayerH : integer;
signal PlayerV : integer;
signal VideoON : STD_LOGIC;
signal GameON : STD_LOGIC;
signal obstacle1H : integer;
signal obstacle1V : integer;
signal obstacle2H : integer;
signal obstacle2V : integer;
signal obstacle3H : integer;
signal obstacle3V : integer;
signal obstacle4H : integer;
signal obstacle4V : integer;
signal obstacle5H : integer;
signal obstacle5V : integer;
signal obstacle6H : integer;
signal obstacle6V : integer;
signal obstacle7H : integer;
signal obstacle7V : integer;
signal obstacle8H : integer;
signal obstacle8V : integer;
signal obstacle9H : integer;
signal obstacle9V : integer;
signal obstacle10H : integer;
signal obstacle10V : integer;
signal obstacle11H : integer;
signal obstacle11V : integer;
signal obstacle12H : integer;
signal obstacle12V : integer;
signal GameTimePlayed : integer; 
 
       
component synchronization is
    Port( clk : in STD_LOGIC;
          Hp : out integer;
          Vp : out integer;
          VideoOn : out STD_LOGIC;
          Hsync : out STD_LOGIC;
          Vsync : out STD_LOGIC );
end component;

component game is
    Port( clk : in STD_LOGIC;
          JC : in STD_LOGIC_VECTOR(2 downto 0);
          GameTimePlayed : out integer;
          GameOnOut : out STD_LOGIC;
          PlayerH : out integer;
          PlayerV : out integer;
          obstacle1H : out integer;
          obstacle1V : out integer;
          obstacle2H : out integer;
          obstacle2V : out integer;
          obstacle3H : out integer;
          obstacle3V : out integer;
          obstacle4H : out integer;
          obstacle4V : out integer;
          obstacle5H : out integer;
          obstacle5V : out integer;
          obstacle6H : out integer;
          obstacle6V : out integer;
          obstacle7H : out integer;
          obstacle7V : out integer;
          obstacle8H : out integer;
          obstacle8V : out integer;
          obstacle9H : out integer;
          obstacle9V : out integer;
          obstacle10H : out integer;
          obstacle10V : out integer;
          obstacle11H : out integer;
          obstacle11V : out integer;
          obstacle12H : out integer;
          obstacle12V : out integer);
end component;

component draw is
    port( GameOn : in STD_LOGIC;
          GameTimePlayed : in integer;
          clk : in STD_LOGIC;
          Hp : in integer;
          Vp : in integer;
          PlayerH : in integer;
          PlayerV : in integer;
          obstacle1H : in integer;
          obstacle1V : in integer;
          obstacle2H : in integer;
          obstacle2V : in integer;
          obstacle3H : in integer;
          obstacle3V : in integer;
          obstacle4H : in integer;
          obstacle4V : in integer;
          obstacle5H : in integer;
          obstacle5V : in integer;
          obstacle6H : in integer;
          obstacle6V : in integer;
          obstacle7H : in integer;
          obstacle7V : in integer;
          obstacle8H : in integer;
          obstacle8V : in integer;
          obstacle9H : in integer;  
          obstacle9V : in integer;  
          obstacle10H : in integer; 
          obstacle10V : in integer; 
          obstacle11H : in integer;
          obstacle11V : in integer; 
          obstacle12H : in integer; 
          obstacle12V : in integer;
          vgaBlue : out STD_LOGIC_VECTOR(3 downto 0);
          vgaGreen : out STD_LOGIC_VECTOR(3 downto 0);
          vgaRed : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component timedisplay is
port( gameOn : in STD_LOGIC;
      clk : in STD_LOGIC;
      startInPut : in STD_LOGIC;
      DisplaySegments : out STD_LOGIC_VECTOR (6 downto 0);
      anods : out STD_LOGIC_VECTOR (3 downto 0));
end component;
          

begin

sync_map: synchronization port map (clk => clk,
          Hp => Hp,
          Vp => Vp,
          VideoOn => VideoOn,
          Hsync => Hsync,
          Vsync => Vsync );
          
game_map: game port map (clk => clk,
          PlayerH => PlayerH,
          PlayerV => PlayerV,
          GameOnOut => GameOn,
          GameTimePlayed => GameTimePlayed,
          JC => JC,
          obstacle1H => obstacle1H,
          obstacle1V => obstacle1V,
          obstacle2H => obstacle2H,
          obstacle2V => obstacle2V,
          obstacle3H => obstacle3H,
          obstacle3V => obstacle3V,
          obstacle4H => obstacle4H,
          obstacle4V => obstacle4v,
          obstacle5H => obstacle5H,
          obstacle5V => obstacle5v,
          obstacle6H => obstacle6H,
          obstacle6V => obstacle6v,
          obstacle7H => obstacle7H,
          obstacle7V => obstacle7v,
          obstacle8H => obstacle8H,
          obstacle8V => obstacle8v,
          obstacle9H => obstacle9H,
          obstacle9V => obstacle9v,
          obstacle10H => obstacle10H,
          obstacle10V => obstacle10v,
          obstacle11H => obstacle11H,
          obstacle11V => obstacle11v,
          obstacle12H => obstacle12H,
          obstacle12V => obstacle12v);
          
draw_map: draw port map (GameOn => GameOn,
          GameTimePlayed => GameTimePlayed, 
          clk => clk,
          Hp => Hp,
          Vp => Vp,
          PlayerH => PlayerH,
          PlayerV => PlayerV,
          obstacle1H => obstacle1H,
          obstacle1V => obstacle1v,
          obstacle2H => obstacle2H,
          obstacle2V => obstacle2v,
          obstacle3H => obstacle3H,
          obstacle3V => obstacle3v,
          obstacle4H => obstacle4H,
          obstacle4V => obstacle4v,
          obstacle5H => obstacle5H,
          obstacle5V => obstacle5v,
          obstacle6H => obstacle6H,
          obstacle6V => obstacle6v,
          obstacle7H => obstacle7H,
          obstacle7V => obstacle7v,
          obstacle8H => obstacle8H,
          obstacle8V => obstacle8v,
          obstacle9H => obstacle9H,
          obstacle9V => obstacle9v,
          obstacle10H => obstacle10H,
          obstacle10V => obstacle10v,
          obstacle11H => obstacle11H,
          obstacle11V => obstacle11v,
          obstacle12H => obstacle12H,
          obstacle12V => obstacle12v,
          vgaBlue => vgaBlue,
          vgaGreen => vgaGreen,
          vgaRed => vgaRed);

timeDisplayed_map: timedisplay port map (gameOn => gameOn,
                   clk => clk,
                   startInPut => JC(2),
                   DisplaySegments => seg,
                   anods => an);
end Behavioral;

sync module:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synchronization is
    Port( clk : in STD_LOGIC;
          Hp : out integer;
          Vp : out integer;
          VideoOn : out STD_LOGIC;
          Hsync : out STD_LOGIC;
          Vsync : out STD_LOGIC);
end synchronization;

architecture Behavioral of synchronization is

constant h_display : integer := 1440;
constant h_f_porch : integer := 80;
constant h_b_porch : integer := 232;
constant h_synch_pulse : integer := 152;
constant v_display : integer := 900;
constant v_f_porch : integer := 1;
constant v_b_porch : integer := 28;
constant v_synch_pulse : integer := 3;
signal counter : integer := 0;
signal d_clk : std_logic := clk;
signal hz : integer := 0;
signal vt : integer := 0;
signal hdisp : std_logic := '0';
signal vdisp : std_logic := '0';

begin

process(clk, hz, vt)
begin
if (rising_edge (clk)) then
    if ( hz > h_display + h_f_porch + h_b_porch + h_synch_pulse - 1 ) then
        vt <= vt + 1;
        hz <= 1;
    else
        hz <= hz + 1;
    end if;
    
    if ( vt > v_display + v_f_porch + v_b_porch + v_synch_pulse - 1 ) then
        vt <= 1;
    end if;
    
end if;
end process;

process (clk, hz)
begin
    if (hz < h_b_porch + 1) then
        Hsync <= '1';
        hdisp <= '0';
    elsif (hz > h_b_porch and hz < h_b_porch + h_display + 1) then
        Hsync <= '1';
        hdisp <= '1';
    elsif ( hz > h_b_porch + h_display and hz < h_b_porch + h_display + h_f_porch + 1) then
        Hsync <= '1';
        hdisp <= '0';
    elsif ( hz >  h_b_porch + h_display + h_f_porch) then
        Hsync <= '0';
        hdisp <= '0';
--    else
--        Hsync <= '0';
    end if;
end process;

process (clk, vt)
begin
    if (vt < v_display + 1) then
        Vsync <= '0';
        vdisp <= '1';
    elsif (vt > v_display and vt < v_display + v_f_porch + 1) then
        Vsync <= '0';
        vdisp <= '0';
    elsif ( vt > v_display + v_f_porch and vt < v_display + v_f_porch + v_synch_pulse + 1) then
        Vsync <= '1';
        vdisp <= '0';
    elsif ( vt > v_display + v_f_porch + v_synch_pulse ) then
        Vsync <= '0';
        vdisp <= '0';
    end if;
end process;


VideoOn <= hdisp and vdisp;
Hp <= hz;
Vp <= vt;

end Behavioral;



game module:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity game is
    Port( clk : in STD_LOGIC;
          JC : in STD_LOGIC_VECTOR(2 downto 0);
          GameTimePlayed : out integer;
          GameOnOut : out STD_LOGIC;
          PlayerH : out integer;
          PlayerV : out integer;
          obstacle1H : out integer;
          obstacle1V : out integer;
          obstacle2H : out integer;
          obstacle2V : out integer;
          obstacle3H : out integer;
          obstacle3V : out integer;
          obstacle4H : out integer;
          obstacle4V : out integer;
          obstacle5H : out integer;
          obstacle5V : out integer;
          obstacle6H : out integer;
          obstacle6V : out integer;
          obstacle7H : out integer;
          obstacle7V : out integer;
          obstacle8H : out integer;
          obstacle8V : out integer;
          obstacle9H : out integer;
          obstacle9V : out integer;
          obstacle10H : out integer;
          obstacle10V : out integer;
          obstacle11H : out integer;
          obstacle11V : out integer;
          obstacle12H : out integer;
          obstacle12V : out integer);
           
                 
end game;

architecture Behavioral of game is
signal gameTimeCounter : integer := 0; 
signal timeplayed : integer:= 0;
signal GameOn : STD_LOGIC:= '0';
signal SlowCounter : integer := 0;
signal SlowCLK : STD_LOGIC:= '0';
signal SlowerCounter : integer := 0;
signal SlowerCLK : STD_LOGIC:= '0';

signal input1clk : integer := 0;
signal input2clk : integer := 0;
signal input3clk : integer := 0;

signal PlayerX : integer:= 432;
signal PlayerY : integer:= 450;
signal PlayerUpVelocity : integer:= 0;
signal PlayerDownVelocity : integer:= 0;

signal Obstacle1X : integer:= 0;
signal Obstacle1Y : integer:= 0;
signal Obstacle1Velocity : integer:= 5;
signal Obstacle2X : integer:= 0;
signal Obstacle2Y : integer:= 0;
signal Obstacle2Velocity : integer:= 5;
signal Obstacle3X : integer:= 0;
signal Obstacle3Y : integer:= 0;
signal Obstacle3Velocity : integer:= 5;
signal Obstacle4X : integer:= 0;
signal Obstacle4Y : integer:= 0;
signal Obstacle4Velocity : integer:= 5;
signal Obstacle5X : integer:= 0;
signal Obstacle5Y : integer:= 0;
signal Obstacle5Velocity : integer:= 5;
signal Obstacle6X : integer:= 0;
signal Obstacle6Y : integer:= 0;
signal Obstacle6Velocity : integer:= 5;
signal Obstacle7X : integer:= 0;
signal Obstacle7Y : integer:= 0;
signal Obstacle7Velocity : integer:= 5;
signal Obstacle8X : integer:= 0;
signal Obstacle8Y : integer:= 0;
signal Obstacle8Velocity : integer:= 5;
signal Obstacle9X : integer:= 0;
signal Obstacle9Y : integer:= 0;
signal Obstacle9Velocity : integer:= 5;
signal Obstacle10X : integer:= 0;
signal Obstacle10Y : integer:= 0;
signal Obstacle10Velocity : integer:= 5;
signal Obstacle11X : integer:= 0;
signal Obstacle11Y : integer:= 0;
signal Obstacle11Velocity : integer:= 5;
signal Obstacle12X : integer:= 0;
signal Obstacle12Y : integer:= 0;
signal Obstacle12Velocity : integer:= 5;

signal clapConstan1 : integer;
signal clapConstan2 : integer;
signal clapConstan3 : integer;

begin

process(clk, SlowCLK) -- 1/40 sn clk
begin
    if rising_edge(clk) then 
        if SlowCounter < 1250000 then
            SlowCounter <= SlowCounter + 1;
        else
            SlowCounter <= 0;   
            SlowCLK <= (not SlowCLK);
        end if;
    end if;
end process;

process(clk, SlowerCLK) -- 1/ 10 sn clk
begin
    if rising_edge(clk) then 
        if SlowerCounter < 5000000 then
            SlowerCounter <= SlowerCounter + 1;
        else
            SlowerCounter <= 0;    
            SlowerCLK <= (not SlowerCLK);
        end if;
    end if;
end process;

    
process(clk, GameOn, timeplayed) -- this counts to 100000000 so it takes the same value once a second (gameTimeCounter) and the clock that counts the gameplay time
begin
    if rising_edge(clk) then
        if gameTimeCounter < 100000000 then
            gameTimeCounter <= gameTimeCounter +1;
        else 
            gameTimeCounter <= 0;
            if GameOn = '1' then
                timeplayed <= timeplayed +1;
            else
                timeplayed <= 0;
            end if;
        end if;
    end if;
end process;
process(clk, GameOn, JC, gameTimeCounter) -- the game on off process
begin
    if rising_edge(clk)then
        if GameOn = '0' and JC(2) = '1' then
            GameOn <= '1';       

        elsif GameOn = '1' then
            if (PlayerY < 50) or (PlayerY > 850) or            
               ((PlayerY < Obstacle1Y) and (PlayerY > Obstacle1Y - 100) and (PlayerX > Obstacle1X) and (PlayerX < Obstacle1X +100)) or
               ((PlayerY < Obstacle2Y) and (PlayerY > Obstacle2Y - 100) and (PlayerX > Obstacle2X) and (PlayerX < Obstacle2X +100)) or
               ((PlayerY < Obstacle3Y) and (PlayerY > Obstacle3Y - 100) and (PlayerX > Obstacle3X) and (PlayerX < Obstacle3X +100)) or
               ((PlayerY < Obstacle4Y) and (PlayerY > Obstacle4Y - 100) and (PlayerX > Obstacle4X) and (PlayerX < Obstacle4X +100)) or
               ((PlayerY < Obstacle5Y) and (PlayerY > Obstacle5Y - 100) and (PlayerX > Obstacle5X) and (PlayerX < Obstacle5X +100)) or
               ((PlayerY < Obstacle6Y) and (PlayerY > Obstacle6Y - 100) and (PlayerX > Obstacle6X) and (PlayerX < Obstacle6X +100)) or
               ((PlayerY < Obstacle7Y) and (PlayerY > Obstacle7Y - 100) and (PlayerX > Obstacle7X) and (PlayerX < Obstacle7X +100)) or
               ((PlayerY < Obstacle8Y) and (PlayerY > Obstacle8Y - 100) and (PlayerX > Obstacle8X) and (PlayerX < Obstacle8X +100)) or
               ((PlayerY < Obstacle9Y) and (PlayerY > Obstacle9Y - 100) and (PlayerX > Obstacle9X) and (PlayerX < Obstacle9X +100)) or
               ((PlayerY < Obstacle10Y) and (PlayerY > Obstacle10Y - 100) and (PlayerX > Obstacle10X) and (PlayerX < Obstacle10X +100)) or
               ((PlayerY < Obstacle11Y) and (PlayerY > Obstacle11Y - 100) and (PlayerX > Obstacle11X) and (PlayerX < Obstacle11X +100)) or
               ((PlayerY < Obstacle12Y) and (PlayerY > Obstacle12Y - 100) and (PlayerX > Obstacle12X) and (PlayerX < Obstacle12X +100)) then
                GameOn <= '0';
            end if;   
        end if;
    end if;  
end process;    



process(SlowCLK, gameTimeCounter, Obstacle1X, Obstacle1Velocity, GameOn) -- computations for the first obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle1X < 130) and (GameOn = '1'))then
                Obstacle1X <= (1672 + (gameTimeCounter mod 1358));
                Obstacle1Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle1Velocity <= ((gameTimeCounter mod 6) + 8);
            elsif GameOn = '1' then
                Obstacle1X <= Obstacle1X - Obstacle1Velocity;
            elsif GameOn = '0' then
                Obstacle1X <= 5 ;
        end if;
    end if;                
end process;                  

process(SlowCLK, gameTimeCounter, Obstacle2X, Obstacle2Velocity, GameOn) -- computations for the second obcejt
begin
    if rising_edge(SlowCLK)then
        if ((Obstacle2X < 130) and (GameOn = '1')) then
            Obstacle2X <= (1672 + (gameTimeCounter mod 937));
            Obstacle2Y <= (((gameTimeCounter + 300) mod 850) + 101);
            Obstacle2Velocity <= ((gameTimeCounter mod 4) + 9);
        elsif GameOn = '1' then
                Obstacle2X <= Obstacle2X - Obstacle2Velocity;
        elsif GameOn = '0' then
            Obstacle2X <= 5 ;        
        end if;
    end if;                
end process;                

process(SlowCLK, gameTimeCounter, Obstacle3X, Obstacle3Velocity, GameOn) -- computations for the third obcejt
begin
    if rising_edge(SlowCLK) then
        if ((Obstacle3X < 130) and (GameOn = '1')) then
            Obstacle3X <= (1672 + (gameTimeCounter mod 1423));
            Obstacle3Y <= (((gameTimeCounter +750) mod 850) + 101);
            Obstacle3Velocity <= ((gameTimeCounter mod 5) + 8);
        elsif GameOn = '1' then
            Obstacle3X <= Obstacle3X - Obstacle3Velocity;
        elsif GameOn = '0' then
            Obstacle3X <= 5 ;
        end if;
    end if;                
end process;                

process(SlowCLK, gameTimeCounter, Obstacle4X, Obstacle4Velocity, GameOn) -- computations for the fourth obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle4X < 130) and (GameOn = '1')) and (timePlayed > 10) then
                Obstacle4X <= (1672 + (gameTimeCounter mod 871));
                Obstacle4Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle4Velocity <= ((gameTimeCounter mod 6) + 9);
            elsif GameOn = '1' then
                Obstacle4X <= Obstacle4X - Obstacle4Velocity;
            elsif GameOn = '0' then
                Obstacle4X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle5X, Obstacle5Velocity, GameOn) -- computations for the 5th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle5X < 130) and (GameOn = '1')) and (timePlayed > 20) then
                Obstacle5X <= (1672 + (gameTimeCounter mod 1632));
                Obstacle5Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle5Velocity <= ((gameTimeCounter mod 5) + 10);
            elsif GameOn = '1' then
                Obstacle5X <= Obstacle5X - Obstacle5Velocity;
            elsif GameOn = '0' then
                Obstacle5X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle6X, Obstacle6Velocity, GameOn) -- computations for the 6th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle6X < 130) and (GameOn = '1')) and (timePlayed > 30) then
                Obstacle6X <= (1672 + (gameTimeCounter mod 1082));
                Obstacle6Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle6Velocity <= ((gameTimeCounter mod 4) + 11);
            elsif GameOn = '1' then
                Obstacle6X <= Obstacle6X - Obstacle6Velocity;
            elsif GameOn = '0' then
                Obstacle6X <= 5 ;
        end if;
    end if;                
end process;                  

process(SlowCLK, gameTimeCounter, Obstacle7X, Obstacle7Velocity, GameOn) -- computations for the 7th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle7X < 130) and (GameOn = '1')) and (timePlayed > 40) then
                Obstacle7X <= (1672 + (gameTimeCounter mod 1250));
                Obstacle7Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle7Velocity <= ((gameTimeCounter mod 5) + 11);
            elsif GameOn = '1' then
                Obstacle7X <= Obstacle7X - Obstacle7Velocity;
            elsif GameOn = '0' then
                Obstacle7X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle8X, Obstacle8Velocity, GameOn) -- computations for the 8th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle8X < 130) and (GameOn = '1')) and (timePlayed > 50) then
                Obstacle8X <= (1672 + (gameTimeCounter mod 1373));
                Obstacle8Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle8Velocity <= ((gameTimeCounter mod 6) + 10);
            elsif GameOn = '1' then
                Obstacle8X <= Obstacle8X - Obstacle8Velocity;
            elsif GameOn = '0' then
                Obstacle8X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle9X, Obstacle9Velocity, GameOn) -- computations for the 9th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle9X < 130) and (GameOn = '1')) and (timePlayed > 60) then
                Obstacle9X <= (1672 + (gameTimeCounter mod 1373));
                Obstacle9Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle9Velocity <= ((gameTimeCounter mod 3) + 12);
            elsif GameOn = '1' then
                Obstacle9X <= Obstacle9X - Obstacle9Velocity;
            elsif GameOn = '0' then
                Obstacle9X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle10X, Obstacle10Velocity, GameOn) -- computations for the 10th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle10X < 130) and (GameOn = '1')) and (timePlayed > 70) then
                Obstacle10X <= (1672 + (gameTimeCounter mod 1373));
                Obstacle10Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle10Velocity <= ((gameTimeCounter mod 4) + 11);
            elsif GameOn = '1' then
                Obstacle10X <= Obstacle10X - Obstacle10Velocity;
            elsif GameOn = '0' then
                Obstacle10X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle11X, Obstacle11Velocity, GameOn) -- computations for the 11th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle11X < 130) and (GameOn = '1')) and (timePlayed > 80) then
                Obstacle11X <= (1672 + (gameTimeCounter mod 1373));
                Obstacle11Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle11Velocity <= ((gameTimeCounter mod 5) + 11);
            elsif GameOn = '1' then
                Obstacle11X <= Obstacle11X - Obstacle11Velocity;
            elsif GameOn = '0' then
                Obstacle11X <= 5 ;
        end if;
    end if;                
end process;  

process(SlowCLK, gameTimeCounter, Obstacle12X, Obstacle12Velocity, GameOn) -- computations for the 12th obcejt
begin
        if rising_edge(SlowCLK) then
            if ((Obstacle12X < 130) and (GameOn = '1')) and (timePlayed > 90) then
                Obstacle12X <= (1672 + (gameTimeCounter mod 1373));
                Obstacle12Y <= ((gameTimeCounter mod 850) + 101);
                Obstacle12Velocity <= ((gameTimeCounter mod 4) + 12);
            elsif GameOn = '1' then
                Obstacle12X <= Obstacle12X - Obstacle12Velocity;
            elsif GameOn = '0' then
                Obstacle12X <= 5 ;
        end if;
    end if;                
end process;  

process(clk, SlowCLK, SlowerCLK, PlayerX, PlayerY, PlayerUpVelocity, PlayerDownVelocity, JC, GameOn) -- all the computations for the players
begin      
    if (GameOn = '1') then      
        
        if rising_edge(clk) then -- input legnhtning 
        
            if JC(0) = '1' then
                input1clk <= input1clk +1;
            elsif input1clk > 20000005 then
                input1clk <= 0;
            elsif input1clk > 0 then
                input1clk <= input1clk +1;
            
            end if;
       
            if JC(1) = '1' then
                input2clk <= input2clk +1;
            elsif input2clk > 20000005 then
                input2clk <= 0;
            elsif input2clk > 0 then
                input2clk <= input2clk +1;
            
            end if;
            
            if JC(2) = '1' then
                input3clk <= input3clk +1;
            elsif input3clk > 20000005 then
                input3clk <= 0;
            elsif input3clk > 0 then
                input3clk <= input3clk +1;

            end if;
        end if;
       
        
        if rising_edge(SlowerCLK) then -- players velocity computation
            
            if PlayerDownVelocity < (PlayerUpVelocity + 12) then
                PlayerDownVelocity <= PlayerDownVelocity + 2;
            end if;
            
            if PlayerUpVelocity < (PlayerDownVelocity + 11) then                         
                if (input1clk > 0) and (input2clk > 0) and (input3clk > 0) then
                    PlayerUpVelocity <= PlayerUpVelocity + 7;
                
                elsif ((input1clk > 0) and (input2clk > 0))  or ((input2clk > 0) and (input3clk > 0)) or ((input3clk > 0) and (input1clk > 0)) then
                    PlayerUpVelocity <= PlayerUpVelocity + 4;
           
                elsif (input1clk > 0) or (input2clk > 0) or (input3clk > 0) then
                    PlayerUpVelocity <= PlayerUpVelocity + 3;
                end if;
            end if;
        end if;
                
        if rising_edge(slowCLK) then -- players Y axis computation                   
            PlayerY <= (PlayerY + PlayerDownVelocity - PlayerUpVelocity);
        end if;
    else
    
        PlayerY <= 450;
        PlayerUpVelocity <= 0;
        PlayerDownVelocity <= 0;
        
    end if;
end process;

PlayerH <= PlayerX;
PlayerV <= PlayerY;
gameTimePlayed <= TimePlayed;
obstacle1H <= Obstacle1X;
obstacle1V <= Obstacle1Y;
obstacle2H <= Obstacle2X;
obstacle2V <= Obstacle2Y;
obstacle3H <= Obstacle3X;
obstacle3V <= Obstacle3Y;
obstacle4H <= Obstacle4X;
obstacle4V <= Obstacle4Y;
obstacle5H <= Obstacle5X;
obstacle5V <= Obstacle5Y;
obstacle6H <= Obstacle6X;
obstacle6V <= Obstacle6Y;
obstacle7H <= Obstacle7X;
obstacle7V <= Obstacle7Y;
obstacle8H <= Obstacle8X;
obstacle8V <= Obstacle8Y;
obstacle9H <= obstacle9X;
obstacle9V <= obstacle9Y;
obstacle10H <= obstacle10X;
obstacle10V <= obstacle10Y;
obstacle11H <= obstacle11X;
obstacle11V <= obstacle11Y;
obstacle12H <= obstacle12X;
obstacle12V <= obstacle12Y;
GameOnOut <= GameOn;
            
end behavioral;

draw module:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.numeric_std.ALL; 


entity draw is
    port( GameOn : in STD_LOGIC;
          GameTimePlayed : in integer;
          clk : in STD_LOGIC;
          Hp : in integer;
          Vp : in integer;
          PlayerH : in integer;
          PlayerV : in integer;
          obstacle1H : in integer;
          obstacle1V : in integer;
          obstacle2H : in integer;
          obstacle2V : in integer;
          obstacle3H : in integer;
          obstacle3V : in integer;
          obstacle4H : in integer;
          obstacle4V : in integer;
          obstacle5H : in integer;
          obstacle5V : in integer;
          obstacle6H : in integer;
          obstacle6V : in integer;
          obstacle7H : in integer;
          obstacle7V : in integer;
          obstacle8H : in integer;
          obstacle8V : in integer;
          obstacle9H : in integer;  
          obstacle9V : in integer;  
          obstacle10H : in integer; 
          obstacle10V : in integer; 
          obstacle11H : in integer;
          obstacle11V : in integer; 
          obstacle12H : in integer; 
          obstacle12V : in integer;
          vgaBlue : out STD_LOGIC_VECTOR(3 downto 0);
          vgaGreen : out STD_LOGIC_VECTOR(3 downto 0);
          vgaRed : out STD_LOGIC_VECTOR(3 downto 0));
end draw;

architecture Behavioral of draw is

signal Red1 : STD_LOGIC_VECTOR(3 downto 0);
signal Blue1 : STD_LOGIC_VECTOR(3 downto 0);
signal Green1 : STD_LOGIC_VECTOR(3 downto 0);

begin

process(GametimePlayed, clk)
begin
if rising_edge(clk) then
    if GametimePlayed < 11 then
        Blue1 <= "0011";
        Green1 <= "0011";           --gri
        Red1 <= "0011";
        
    elsif (GametimePlayed < 21) then
        Blue1 <= "0100";
        Green1 <= "0010";           --morumsu
        Red1 <= "0010";        
     
    elsif (GametimePlayed < 31) then
        Blue1 <= "0110";
        Green1 <= "0011";           --mavimsi
        Red1 <= "0000";        
    
    elsif (GametimePlayed < 41) then
        Blue1 <= "0000";
        Green1 <= "0110";           --turuncu
        Red1 <= "1111";        
  
    elsif GametimePlayed < 51 then
        Blue1 <= "0011";
        Green1 <= "0000";           --koyu pembe
        Red1 <= "0011";
       
    elsif (GametimePlayed < 61) then
        Blue1 <= "0000";
        Green1 <= "1101";           --fıstıkyeşili
        Red1 <= "0101";        
       
    elsif (GametimePlayed < 71) then
        Blue1 <= "0011";
        Green1 <= "1011";           --güezl sarı
        Red1 <= "1111";        
       
    elsif (GametimePlayed < 81) then
        Blue1 <= "1111";
        Green1 <= "0000";           --lila
        Red1 <= "1000";        
        
    elsif (GametimePlayed < 91) then
        Blue1 <= "1111";
        Green1 <= "1100";           --çok açık mavi
        Red1 <= "0111";        
      
    elsif (GametimePlayed < 101) then
        Blue1 <= "0000";
        Green1 <= "0000";           -- son
        Red1 <= "1100";        
       
        
    end if;
end if;
end process;



process (clk, Hp, Vp, PlayerH, PlayerV, obstacle1H, obstacle1V, obstacle2H, obstacle2V, obstacle3H, obstacle3V, obstacle4H, obstacle4V, obstacle5H, obstacle5V, obstacle6H, obstacle6V, obstacle7H, obstacle7V, obstacle8H, obstacle8V, obstacle9H, obstacle9V, obstacle10H, obstacle10V, obstacle11H, obstacle11V, obstacle12H, obstacle12V, Blue1, Green1, Red1, gameOn)
begin
    if rising_edge(clk) then
        if GameOn = '1' then
            if (Vp < 50) or (849 < Vp) or
               (((obstacle1H < Hp) and (Hp < (obstacle1H + 100))) and ((obstacle1V - 100 < Vp) and (Vp < (obstacle1V)))) or
               (((obstacle2H < Hp) and (Hp < (obstacle2H + 100))) and ((obstacle2V - 100 < Vp) and (Vp < (obstacle2V)))) or
               (((obstacle3H < Hp) and (Hp < (obstacle3H + 100))) and ((obstacle3V - 100 < Vp) and (Vp < (obstacle3V)))) or
               (((obstacle4H < Hp) and (Hp < (obstacle4H + 100))) and ((obstacle4V - 100 < Vp) and (Vp < (obstacle4V)))) or
               (((obstacle5H < Hp) and (Hp < (obstacle5H + 100))) and ((obstacle5V - 100 < Vp) and (Vp < (obstacle5V)))) or
               (((obstacle6H < Hp) and (Hp < (obstacle6H + 100))) and ((obstacle6V - 100 < Vp) and (Vp < (obstacle6V)))) or
               (((obstacle7H < Hp) and (Hp < (obstacle7H + 100))) and ((obstacle7V - 100 < Vp) and (Vp < (obstacle7V)))) or
               (((obstacle8H < Hp) and (Hp < (obstacle8H + 100))) and ((obstacle8V - 100 < Vp) and (Vp < (obstacle8V)))) or
               (((obstacle9H < Hp) and (Hp < (obstacle9H + 100))) and ((obstacle9V - 100 < Vp) and (Vp < (obstacle9V)))) or
               (((obstacle10H < Hp) and (Hp < (obstacle10H + 100))) and ((obstacle10V - 100 < Vp) and (Vp < (obstacle10V)))) or
               (((obstacle11H < Hp) and (Hp < (obstacle11H + 100))) and ((obstacle11V - 100 < Vp) and (Vp < (obstacle11V)))) or
               (((obstacle12H < Hp) and (Hp < (obstacle12H + 100))) and ((obstacle12V - 100 < Vp) and (Vp < (obstacle12V)))) then 
                    vgaBlue <= Blue1;
                    vgaGreen <= Green1;           
                    vgaRed <= Red1;
            
            elsif (((PlayerH - 25) < Hp) and (Hp < (PlayerH + 25)) and ((PlayerV - 25) < Vp) and (Vp < (PlayerV + 25))) then
                vgaBlue <= "1111";
                vgaGreen <= "1111";
                vgaRed <= "1111";
            else
                vgaBlue <= "0000";
                vgaGreen <= "0000";
                vgaRed <= "0000"; 
            end if;
        elsif GameOn = '0' then
            vgaBlue <= "0000";
            vgaGreen <= "0000";
            vgaRed <= "0000"; 
        end if;
    end if;
end process;

end behavioral;
   
timedisplay module:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity timedisplay is
    port( clk : in STD_LOGIC;
          GameON : in STD_LOGIC;
          startInPut : in STD_LOGIC;
          DisplaySegments : out STD_LOGIC_VECTOR (6 downto 0);
          anods : out STD_LOGIC_VECTOR (3 downto 0));
    
end timedisplay;

architecture Behavioral of timedisplay is

signal firstDigit : integer := 0;
signal secondDigit : integer := 0;
signal thirdDigit : integer := 0;
signal fourthDigit : integer := 0;
signal LEDchoice : STD_LOGIC_VECTOR (1 downto 0);
signal displayedDigit : integer;
signal count : integer;
signal count2 : integer;
begin

process(clk, firstDigit, secondDigit, GameON, startInPut)
begin
    if GameON = '1' then
        if rising_edge(clk) then
            if count < 100000000 then
                count <= count + 1;
            else
                count <= 0;
                if firstDigit < 9 then
                    firstDigit <= firstDigit + 1;
                else
                    firstDigit <= 0;
                    if secondDigit < 9 then
                        secondDigit <= secondDigit + 1;
                    else 
                        secondDigit <= 0;
                        if thirdDigit < 9 then
                            thirdDigit <= thirdDigit + 1;
                        else
                            thirdDigit <= 0;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    elsif GameOn = '0' and startInPut = '1' then
        firstDigit <= 0;
        secondDigit <= 0;
        thirdDigit <= 0;
        
    end if;
end process;            
    
process(clk, count2, LEDchoice)
begin
    if rising_edge(clk) then
        if count2 < 100000 then
            count2 <= count2 + 1;
        else
            count2 <= 0;
            if LEDchoice = "00" then
                LEDchoice <= "01";
            elsif LEDchoice = "01" then
                LEDchoice <= "10";
            elsif LEDchoice = "10" then
                LEDchoice <= "11";
            elsif LEDchoice = "11" then
                LEDchoice <= "00";
            end if;
        end if;          
    end if;
end process;        


process(LEDchoice, firstDigit, secondDigit, thirdDigit, fourthDigit)
begin
    case LEDchoice is
    when "00" =>
        anods <= "1110";        
        -- activate LED1 and Deactivate LED2, LED3, LED4
        displayedDigit <= firstDigit;        
    when "01" =>
        anods <= "1101";        
        -- activate LED1 and Deactivate LED2, LED3, LED4
        displayedDigit <= secondDigit;        
    when "10" =>
        anods <= "1011";        
        -- activate LED1 and Deactivate LED2, LED3, LED4
        displayedDigit <= thirdDigit;        
    when "11" =>
        anods <= "0111";        
        -- activate LED1 and Deactivate LED2, LED3, LED4
        displayedDigit <= fourthDigit;        
     end case;   
end process;

process(displayedDigit)
begin
    case DisplayedDigit is
    when 0 => DisplaySegments <= "0000001"; -- "0"     
    when 1 => DisplaySegments <= "1001111"; -- "1" 
    when 2 => DisplaySegments <= "0010010"; -- "2" 
    when 3 => DisplaySegments <= "0000110"; -- "3" 
    when 4 => DisplaySegments <= "1001100"; -- "4" 
    when 5 => DisplaySegments <= "0100100"; -- "5" 
    when 6 => DisplaySegments <= "0100000"; -- "6" 
    when 7 => DisplaySegments <= "0001111"; -- "7" 
    when 8 => DisplaySegments <= "0000000"; -- "8"     
    when 9 => DisplaySegments <= "0000100"; -- "9" 
    when others => DisplaySegments <= "0000001"; -- "0" 
end case;
end process;

end Behavioral;



Constrants:

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {JC[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JC[0]}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {JC[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JC[1]}]
#Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {JC[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]



##VGA Connector
set_property PACKAGE_PIN G19 [get_ports {vgaRed[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
set_property PACKAGE_PIN H19 [get_ports {vgaRed[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
set_property PACKAGE_PIN J19 [get_ports {vgaRed[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
set_property PACKAGE_PIN N19 [get_ports {vgaRed[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
set_property PACKAGE_PIN N18 [get_ports {vgaBlue[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
set_property PACKAGE_PIN L18 [get_ports {vgaBlue[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
set_property PACKAGE_PIN K18 [get_ports {vgaBlue[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
set_property PACKAGE_PIN J18 [get_ports {vgaBlue[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
set_property PACKAGE_PIN J17 [get_ports {vgaGreen[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
set_property PACKAGE_PIN H17 [get_ports {vgaGreen[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
set_property PACKAGE_PIN G17 [get_ports {vgaGreen[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
set_property PACKAGE_PIN D17 [get_ports {vgaGreen[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
set_property PACKAGE_PIN P19 [get_ports Hsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports Hsync]
set_property PACKAGE_PIN R19 [get_ports Vsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports Vsync]
