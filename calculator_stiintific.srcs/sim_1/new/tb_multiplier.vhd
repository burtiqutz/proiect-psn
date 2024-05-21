----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 02:07:07 PM
-- Design Name: 
-- Module Name: tb_multiplier - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_multiplier is
--  Port ( );
end tb_multiplier;

architecture Behavioral of tb_multiplier is

component multiplier is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           answer : out STD_LOGIC_VECTOR (15 downto 0);
           rst : in std_logic);
end component multiplier;


signal x_tb : STD_LOGIC_VECTOR(7 downto 0);
signal y_tb : STD_LOGIC_VECTOR(7 downto 0);
signal clk_tb : STD_LOGIC;
signal a_tb : STD_LOGIC_VECTOR(15 downto 0);
signal r : std_logic := '0';

begin
et: multiplier port map (x => x_tb, y => y_tb, clk => clk_tb, answer => a_tb, rst => r);

clock_sim: process
begin
    clk_tb <= '0';
    wait for 1 ns;
    clk_tb <= '1';
    wait for 1 ns;
end process;

main_process: process
begin
    x_tb <= "00000101";
    y_tb <= "00001010"; 
    wait for 10ns;
    wait;
end process;

end Behavioral;
