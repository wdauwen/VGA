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
           ro : out  STD_LOGIC;
           go : out  STD_LOGIC;
           bo : out  STD_LOGIC);
end TOP;

architecture Behavioral of TOP is
signal clkdiv2, hscreen, vscreen, blank, enable : STD_LOGIC;
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
					if clk'event and clk = '1' then
						x := x + 1;
						if x = 800 then
							x := 0;
						end if;
						if x < 96 then
								hso <= '0';
						else hso <= '1';
						end if ;
						if x > 112 and x < 752 then
							hscreen <= '1';
						else 
							hscreen <= '0';
						end if;
						if x := 799 then
							enable <= '1';
							else 
							enable <= '0';
						end if;		
					end if;
				end process;
				
		vsdiv: process (clkdiv2)
		variable x : INTEGER := 0;
				begin
				if clk'event and clk = '1' then  
					if enable = '1' then
						x := x + 1;
						if x = 521 then
							x := 0;
						end if;
						if x < 2 then
								vso <= '0';
						else vso <= '1';
						end if ;
							
						if x > 12 and x < 451 then
							vscreen <= '1';
						else 
							vscreen <= '0';
						end if;
					end if
				end if;
		end process;
end Behavioral;

