----------------------------------------------------------------------------------
-- Company: UCLL
-- Engineer: WILLEM DAUWEN
-- 
-- Create Date:    19:03:25 10/19/2015 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
-- Project Name: VGA
-- Target Devices: PARTAN 3-700A
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
signal clkdiv2, hsdiv, vsdiv, screen, blank : STD_LOGIC;
begin
		clkdiv2: process(clk)
				begin
					if clk'event and clk = '1' then
						clkdiv2 <= not clkdiv2;
					end if;
				end process;
		hsdiv: process(clkdiv2)
				begin
				end process;
		vsdiv: process ()
				begin
				end process;

end Behavioral;

