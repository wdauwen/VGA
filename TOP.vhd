----------------------------------------------------------------------------------
-- Company: UCLL
-- Engineer: WILLEM DAUWEN
-- 
-- Create Date:    19:03:25 10/19/2015 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
-- Project Name: VGA
-- Target Devices: SPARTAN 3-700A
-- Tool versions: ISE
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
    Port ( clk : in  STD_LOGIC;
           hso : out  STD_LOGIC;
           vso : out  STD_LOGIC;
           ro : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
           go : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
           bo : out  STD_LOGIC_VECTOR (3 downto 0):= "0000");
end TOP;

architecture Behavioral of TOP is
signal clkdiv2, hscreen, vscreen, onscreen, enable, xpos, ypos : STD_LOGIC;
signal red, green, blue : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
		P_clkdiv2: process(clk)
				begin
					if clk'event and clk = '1' then
						clkdiv2 <= not clkdiv2;
					end if;
				end process;
				
		hsdiv: process(clkdiv2)
			variable x : INTEGER := 0;
		begin
			if clkdiv2'event and clkdiv2 = '1' then
				x := x + 1;
				if x = 800 then
					x := 0;
				end if;
				if x < 96 then
					hso <= '0';
				else
					hso <= '1';
				end if ;
				if x > 112 and x < 112+640 then
					hscreen <= '1';
				else 
					hscreen <= '0';
				end if;
				if x = 799 then
					enable <= '1';
				else 
					enable <= '0';
				end if;		
			end if;
		end process;
				
		vsdiv: process (clkdiv2)
			variable x : INTEGER := 0;
		begin
			if clkdiv2'event and clkdiv2 = '1' then  
				if enable = '1' then
					x := x + 1;
					if x = 521 then
						x := 0;
					end if;
					if x < 2 then
						vso <= '0';
					else 
						vso <= '1';
					end if ;
						
					if x > 12 and x < 12+480 then
						vscreen <= '1';
					else 
						vscreen <= '0';
					end if;
				end if;
			end if;
		end process;
		
		figuur: process (clkdiv2)
			variable xpos : natural range 0 to 300000000 := 0;
			variable ypos :natural range 0 to 300000000 := 0;
		begin
			if clkdiv2'event and clkdiv2 = '1' then 	
				if onscreen = '1' then
					xpos := xpos +1;
				else
					xpos := 0;
				end if;
				
				if xpos = 639 then
					ypos := ypos + 1;
				end if;
				if vscreen = '0' then
					ypos := 0;
				end if;
				if xpos < 320  and ypos < 240 then
					red <= "0000";
					green <= "1111";
					blue <= "0000";
				end if;
				if xpos < 320  and ypos > 240 then
					red <= "1111";
					green <= "1111";
					blue <= "0000";
				end if;
				if xpos > 320  and ypos > 240 then
					red <= "0000";
					green <= "1111";
					blue <= "1111";
				end if;
				if xpos > 320  and ypos < 240 then
					red <= "0000";
					green <= "0000";
					blue <= "1111";
				end if;
				if onscreen = '0' then
					red <= "1111";
					green <= "0000";
					blue <= "0000";
				end if;
			end if;
		end process;
		
		onscreen <= vscreen and hscreen;
		ro <= red and onscreen&onscreen&onscreen&onscreen;
		go <= green and onscreen&onscreen&onscreen&onscreen;
		bo <= blue and onscreen&onscreen&onscreen&onscreen;
		

end Behavioral;

