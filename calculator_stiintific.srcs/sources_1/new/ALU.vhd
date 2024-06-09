----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 10:38:20 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           btn : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           an : out std_logic_vector (7 downto 0);
           cat : out std_logic_vector(6 downto 0)
           );
end ALU;

architecture Behavioral of ALU is

signal output : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

signal sumOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal sumOutput_8bit : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

signal subOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal subOutput_8bit : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

signal mulOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

signal divOutput : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal divOutput_8bit : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal remainder_8bit : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

signal carryOut : STD_LOGIC;
signal Borrow : STD_LOGIC;

component inmultire is
  Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
         b : in STD_LOGIC_VECTOR (7 downto 0);
         result : out STD_LOGIC_VECTOR (15 downto 0));
end component inmultire;

component divider8 is
  Port (a, b: in std_logic_vector(7 downto 0);
        q, r: out std_logic_vector(7 downto 0));
end component divider8;

component debouncer is
    Port ( Clk : in STD_LOGIC;
           D_in : in STD_LOGIC;
           Q_out : out STD_LOGIC);
end component;

component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(31 downto 0);
           an: out STD_LOGIC_VECTOR(7 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component SSD;

component signed_magnitude_adder is
    Port (
        A : in  STD_LOGIC_VECTOR (7 downto 0); -- First 8-bit signed magnitude input
        B : in  STD_LOGIC_VECTOR (7 downto 0); -- Second 8-bit signed magnitude input
        Sum : out  STD_LOGIC_VECTOR (7 downto 0)); -- 8-bit signed magnitude sum
end component signed_magnitude_adder;

signal operation : std_logic_vector (2 downto 0):= "000";
signal outputDisplay : std_logic_vector (31 downto 0);
signal a_mag : std_logic_vector (7 downto 0);
signal b_mag : std_logic_vector (7 downto 0);
signal sign : std_logic := '0';
begin
a_mag <= '0' & a(6 downto 0);
b_mag <= '0' & b(6 downto 0);
adunare: signed_magnitude_adder port map (a => a, b => b, sum => sumOutput_8bit);

multiply: inmultire port map (a => a_mag,
                              b => b_mag,
                              result => mulOutput
                              );

impartire: divider8 port map(a_mag, b_mag, divOutput_8bit, remainder_8bit);
                           
sign <= a(7) xor b(7);                          
sumOutput <= sumOutput_8bit(7) & "00000000" & sumOutput_8bit(6 downto 0);
divOutput <= "00000000" & divOutput_8bit;

impartireBtn:debouncer port map(clk =>clk,D_in => btn(2),Q_out => operation(2));
inmultireBtn:debouncer port map(clk =>clk,D_in =>btn(1),Q_out => operation(1));
adunareBtn:debouncer port map(clk => clk,D_in => btn(0),Q_out => operation(0));--not needed

with btn select
               output <= sumOutput when "100",
                           sign & mulOutput(14 downto 0) when "010",
                            sign & divOutput(14 downto 0) when "001",
                            (others => '0') when others;                    
                             
outputDisplay <= a & b & output(15 downto 0);

afisare: SSD port map (clk => clk, digits => outputDisplay, an => an, cat => cat);
end Behavioral;
