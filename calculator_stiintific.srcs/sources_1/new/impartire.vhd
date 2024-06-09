----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2024 06:55:44 PM
-- Design Name: 
-- Module Name: impartire - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider8 is
  Port (a, b: in std_logic_vector(7 downto 0);
        q, r: out std_logic_vector(7 downto 0));
end divider8;

architecture Behavioral of divider8 is

signal rest_aux :  std_logic_vector(0 to 15);
signal cat_aux :  std_logic_vector(0 to 15);

signal neshiftat : std_logic_vector(0 to 15);	
signal shift1 : std_logic_vector(0 to 15);	
signal shift2 : std_logic_vector(0 to 15);	
signal shift3 : std_logic_vector(0 to 15);	
signal shift4 : std_logic_vector(0 to 15);	
signal shift5 : std_logic_vector(0 to 15);	
signal shift6 : std_logic_vector(0 to 15);	
signal shift7 : std_logic_vector(0 to 15);	

begin

    neshiftat <= b & "00000000";
    shift1 <= neshiftat + neshiftat; 
    shift2 <= shift1 + shift1; 
	shift3 <= shift2 + shift2;	
	shift4 <= shift3 + shift3;	
	shift5 <= shift4 + shift4;	
	shift6 <= shift5 + shift5;	
	shift7 <= shift6 + shift6;	
	
	process(shift1, shift2, shift3, shift4, shift5, shift6, shift7)
	variable rest_intermediar: std_logic_vector(0 to 15);
	variable cat_intermediar: std_logic_vector(0 to 15);
	
	begin
	
	rest_intermediar := a & "00000000";
	cat_intermediar := "0000000000000000";
	
	if(shift7 > "00000000" and rest_intermediar >= shift7) then 
			rest_intermediar := rest_intermediar - shift7;
			cat_intermediar := cat_intermediar + 128; 
		end if;
		
		if( shift6 > "00000000" and rest_intermediar >= shift6) then
			rest_intermediar := rest_intermediar - shift6;
			cat_intermediar:=cat_intermediar+64; 
		end if;
		
		if( shift5 > "00000000"and rest_intermediar >= shift5) then
			rest_intermediar := rest_intermediar - shift5;
			cat_intermediar := cat_intermediar + 32;
		end if;
		
		if( shift4 > "00000000" and rest_intermediar >= shift4) then
			rest_intermediar := rest_intermediar - shift4;
			cat_intermediar := cat_intermediar + 16;
		end if;
		
		if( shift3 > "00000000" and rest_intermediar >= shift3) then
			rest_intermediar := rest_intermediar - shift3;
			cat_intermediar := cat_intermediar + 8;
		end if;
		
		if( shift2 > "00000000" and rest_intermediar >= shift2) then
			rest_intermediar := rest_intermediar - shift2;
			cat_intermediar := cat_intermediar + 4;
		end if; 
		
		if( shift1 > "00000000" and rest_intermediar >= shift1) then
			rest_intermediar := rest_intermediar - shift1;
			cat_intermediar := cat_intermediar + 2;
		end if; 
		
		if( neshiftat > "00000000" and rest_intermediar >= neshiftat) then
			rest_intermediar := rest_intermediar - neshiftat;
			cat_intermediar := cat_intermediar + 1;
		end if; 
		
	rest_aux <= rest_intermediar;
	cat_aux <= cat_intermediar; 
	
	end process;
	
	r <= rest_aux(0 to 7);
	q <= cat_aux(8 to 15);
	
end Behavioral;
