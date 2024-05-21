----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:49:45 AM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           answer : out STD_LOGIC_VECTOR (15 downto 0);
           rst : in std_logic);
end multiplier;

architecture Behavioral of multiplier is

signal b : std_logic_vector (7 downto 0) := (others => '0');
signal q : std_logic_vector (7 downto 0) := "00000000";
signal count : integer := 0;
signal temp : STD_LOGIC_VECTOR (15 downto 0) := x"0000";


begin

    process(clk)
    begin
        if rising_edge(clk) and count < 8 then
            if rst = '1' then
                b <= x;
                q <= y;
                temp <= (others => '0');
                answer <= (others => '0');
            else
                if q(0) = '1' then
                    temp <= std_logic_vector(signed(temp) + signed(b));
                end if;
                b <= std_logic_vector(signed(b) sll 1);
                q <= std_logic_vector(signed(q) srl 1);
                count <= count + 1;
            end if;
            
        end if;
end process;

answer <= temp;
end Behavioral;
