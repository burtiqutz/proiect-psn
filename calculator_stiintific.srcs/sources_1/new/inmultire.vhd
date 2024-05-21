----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 04:15:48 PM
-- Design Name: 
-- Module Name: inmultire - Behavioral
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

entity inmultire is
  Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
         b : in STD_LOGIC_VECTOR (7 downto 0);
         result : out STD_LOGIC_VECTOR (15 downto 0));
end inmultire;

architecture Behavioral of inmultire is

signal t1, t2, t3, t4, t5, t6 ,t7 : std_logic_vector (7 downto 0);
signal s1, s2, s3, s4, s5, s6 ,s7 : std_logic_vector (7 downto 0);
signal ab0, ab1, ab2, ab3, ab4, ab5, ab6, ab7 : std_logic_vector(7 downto 0);

component full_adder1bit is
    Port ( A : in std_logic ;
           B : in  std_logic;
           SUM : out  std_logic;
           CIN : in  std_logic;
           COUT : out  std_logic);
end component full_adder1bit;

component halfadder_1bit is
    Port (a : in std_logic;
          b : in std_logic;
          cout : out std_logic;
          sum : out std_logic);
end component halfadder_1bit;

begin
--Pregatesc produsele intermediare, cum ar fi pe foaie
ab0(0) <= a(0) and b(0);
ab0(1) <= a(1) and b(0);
ab0(2) <= a(2) and b(0);
ab0(3) <= a(3) and b(0);
ab0(4) <= a(4) and b(0);
ab0(5) <= a(5) and b(0);
ab0(6) <= a(6) and b(0);
ab0(7) <= a(7) and b(0);

ab1(0) <= a(0) and b(1);
ab1(1) <= a(1) and b(1);
ab1(2) <= a(2) and b(1);
ab1(3) <= a(3) and b(1);
ab1(4) <= a(4) and b(1);
ab1(5) <= a(5) and b(1);
ab1(6) <= a(6) and b(1);
ab1(7) <= a(7) and b(1);

ab2(0) <= a(0) and b(2);
ab2(1) <= a(1) and b(2);
ab2(2) <= a(2) and b(2);
ab2(3) <= a(3) and b(2);
ab2(4) <= a(4) and b(2);
ab2(5) <= a(5) and b(2);
ab2(6) <= a(6) and b(2);
ab2(7) <= a(7) and b(2);

ab3(0) <= a(0) and b(3);
ab3(1) <= a(1) and b(3);
ab3(2) <= a(2) and b(3);
ab3(3) <= a(3) and b(3);
ab3(4) <= a(4) and b(3);
ab3(5) <= a(5) and b(3);
ab3(6) <= a(6) and b(3);
ab3(7) <= a(7) and b(3);

ab4(0) <= a(0) and b(4);
ab4(1) <= a(1) and b(4);
ab4(2) <= a(2) and b(4);
ab4(3) <= a(3) and b(4);
ab4(4) <= a(4) and b(4);
ab4(5) <= a(5) and b(4);
ab4(6) <= a(6) and b(4);
ab4(7) <= a(7) and b(4);

ab5(0) <= a(0) and b(5);
ab5(1) <= a(1) and b(5);
ab5(2) <= a(2) and b(5);
ab5(3) <= a(3) and b(5);
ab5(4) <= a(4) and b(5);
ab5(5) <= a(5) and b(5);
ab5(6) <= a(6) and b(5);
ab5(7) <= a(7) and b(5);

ab6(0) <= a(0) and b(6);
ab6(1) <= a(1) and b(6);
ab6(2) <= a(2) and b(6);
ab6(3) <= a(3) and b(6);
ab6(4) <= a(4) and b(6);
ab6(5) <= a(5) and b(6);
ab6(6) <= a(6) and b(6);
ab6(7) <= a(7) and b(6);

ab7(0) <= a(0) and b(7);
ab7(1) <= a(1) and b(7);
ab7(2) <= a(2) and b(7);
ab7(3) <= a(3) and b(7);
ab7(4) <= a(4) and b(7);
ab7(5) <= a(5) and b(7);
ab7(6) <= a(6) and b(7);
ab7(7) <= a(7) and b(7);
--Port mapping pentru a face adunarile intre produse
full_01: full_adder1bit port map (A => ab0(2),B => ab1(1), SUM => s1(1), CIN => t1(0), COUT => t1(1));
full_02: full_adder1bit port map (A => ab0(3),B => ab1(2), SUM => s1(2), CIN => t1(1), COUT => t1(2));
full_03: full_adder1bit port map (A => ab0(4),B => ab1(3), SUM => s1(3), CIN => t1(2), COUT => t1(3));
full_04: full_adder1bit port map (A => ab0(5),B => ab1(4), SUM => s1(4), CIN => t1(3), COUT => t1(4));
full_05: full_adder1bit port map (A => ab0(6),B => ab1(5), SUM => s1(5), CIN => t1(4), COUT => t1(5));
full_06: full_adder1bit port map (A => ab0(7),B => ab1(6), SUM => s1(6), CIN => t1(5), COUT => t1(6));

full_07: full_adder1bit port map (A => s1(2),B => ab2(1), SUM => s2(1), CIN => t2(0), COUT => t2(1));
full_08: full_adder1bit port map (A => s1(3),B => ab2(2), SUM => s2(2), CIN => t2(1), COUT => t2(2));
full_09: full_adder1bit port map (A => s1(4),B => ab2(3), SUM => s2(3), CIN => t2(2), COUT => t2(3));
full_10: full_adder1bit port map (A => s1(5),B => ab2(4), SUM => s2(4), CIN => t2(3), COUT => t2(4));
full_11: full_adder1bit port map (A => s1(6),B => ab2(5), SUM => s2(5), CIN => t2(4), COUT => t2(5));
full_12: full_adder1bit port map (A => s1(7),B => ab2(6), SUM => s2(6), CIN => t2(5), COUT => t2(6));
full_13: full_adder1bit port map (A => t1(7),B => ab2(7), SUM => s2(7), CIN => t2(6), COUT => t2(7));

full_14: full_adder1bit port map (A => s2(2),B => ab3(1), SUM => s3(1), CIN => t3(0), COUT => t3(1));
full_15: full_adder1bit port map (A => s2(3),B => ab3(2), SUM => s3(2), CIN => t3(1), COUT => t3(2));
full_16: full_adder1bit port map (A => s2(4),B => ab3(3), SUM => s3(3), CIN => t3(2), COUT => t3(3));
full_17: full_adder1bit port map (A => s2(5),B => ab3(4), SUM => s3(4), CIN => t3(3), COUT => t3(4));
full_18: full_adder1bit port map (A => s2(6),B => ab3(5), SUM => s3(5), CIN => t3(4), COUT => t3(5));
full_19: full_adder1bit port map (A => s2(7),B => ab3(6), SUM => s3(6), CIN => t3(5), COUT => t3(6));
full_20: full_adder1bit port map (A => t2(7),B => ab3(7), SUM => s3(7), CIN => t3(6), COUT => t3(7));

full_21: full_adder1bit port map (A => s3(2),B => ab4(1), SUM => s4(1), CIN => t4(0), COUT => t4(1));
full_22: full_adder1bit port map (A => s3(3),B => ab4(2), SUM => s4(2), CIN => t4(1), COUT => t4(2));
full_23: full_adder1bit port map (A => s3(4),B => ab4(3), SUM => s4(3), CIN => t4(2), COUT => t4(3));
full_24: full_adder1bit port map (A => s3(5),B => ab4(4), SUM => s4(4), CIN => t4(3), COUT => t4(4));
full_25: full_adder1bit port map (A => s3(6),B => ab4(5), SUM => s4(5), CIN => t4(4), COUT => t4(5));
full_26: full_adder1bit port map (A => s3(7),B => ab4(6), SUM => s4(6), CIN => t4(5), COUT => t4(6));
full_27: full_adder1bit port map (A => t3(7),B => ab4(7), SUM => s4(7), CIN => t4(6), COUT => t4(7));

full_28: full_adder1bit port map (A => s4(2),B => ab5(1), SUM => s5(1), CIN => t5(0), COUT => t5(1));
full_29: full_adder1bit port map (A => s4(3),B => ab5(2), SUM => s5(2), CIN => t5(1), COUT => t5(2));
full_30: full_adder1bit port map (A => s4(4),B => ab5(3), SUM => s5(3), CIN => t5(2), COUT => t5(3));
full_31: full_adder1bit port map (A => s4(5),B => ab5(4), SUM => s5(4), CIN => t5(3), COUT => t5(4));
full_32: full_adder1bit port map (A => s4(6),B => ab5(5), SUM => s5(5), CIN => t5(4), COUT => t5(5));
full_33: full_adder1bit port map (A => s4(7),B => ab5(6), SUM => s5(6), CIN => t5(5), COUT => t5(6));
full_34: full_adder1bit port map (A => t4(7),B => ab5(7), SUM => s5(7), CIN => t5(6), COUT => t5(7));

full_35: full_adder1bit port map (A => s5(2),B => ab6(1), SUM => s6(1), CIN => t6(0), COUT => t6(1));
full_36: full_adder1bit port map (A => s5(3),B => ab6(2), SUM => s6(2), CIN => t6(1), COUT => t6(2));
full_37: full_adder1bit port map (A => s5(4),B => ab6(3), SUM => s6(3), CIN => t6(2), COUT => t6(3));
full_38: full_adder1bit port map (A => s5(5),B => ab6(4), SUM => s6(4), CIN => t6(3), COUT => t6(4));
full_39: full_adder1bit port map (A => s5(6),B => ab6(5), SUM => s6(5), CIN => t6(4), COUT => t6(5));
full_40: full_adder1bit port map (A => s5(7),B => ab6(6), SUM => s6(6), CIN => t6(5), COUT => t6(6));
full_41: full_adder1bit port map (A => t5(7),B => ab6(7), SUM => s6(7), CIN => t6(6), COUT => t6(7));

full_42: full_adder1bit port map (A => s6(2),B => ab7(1), SUM => s7(1), CIN => t7(0), COUT => t7(1));
full_43: full_adder1bit port map (A => s6(3),B => ab7(2), SUM => s7(2), CIN => t7(1), COUT => t7(2));
full_44: full_adder1bit port map (A => s6(4),B => ab7(3), SUM => s7(3), CIN => t7(2), COUT => t7(3));
full_45: full_adder1bit port map (A => s6(5),B => ab7(4), SUM => s7(4), CIN => t7(3), COUT => t7(4));
full_46: full_adder1bit port map (A => s6(6),B => ab7(5), SUM => s7(5), CIN => t7(4), COUT => t7(5));
full_47: full_adder1bit port map (A => s6(7),B => ab7(6), SUM => s7(6), CIN => t7(5), COUT => t7(6));
full_48: full_adder1bit port map (A => t6(7),B => ab7(7), SUM => s7(7), CIN => t7(6), COUT => t7(7));

half_1: halfadder_1bit port map (a => ab0(1),b => ab1(0), cout => t1(0), sum =>s1(0));
half_2: halfadder_1bit port map (a => ab0(7),b => t1(6), cout => t1(7), sum =>s1(7));

half_3: halfadder_1bit port map (a => s1(1),b => ab2(0), cout => t2(0), sum =>s2(0));
half_4: halfadder_1bit port map (a => s2(1),b => ab3(0), cout => t3(0), sum =>s3(0));
half_5: halfadder_1bit port map (a => s3(1),b => ab4(0), cout => t4(0), sum =>s4(0));
half_6: halfadder_1bit port map (a => s4(1),b => ab5(0), cout => t5(0), sum =>s5(0));
half_7: halfadder_1bit port map (a => s5(1),b => ab6(0), cout => t6(0), sum =>s6(0));
half_8: halfadder_1bit port map (a => s6(1),b => ab7(0), cout => t7(0), sum =>s7(0));

--Asignarea rezultatelor:
result(0) <= ab0(0);
result(1) <= s1(0);
result(2) <= s2(0);
result(3) <= s3(0);
result(4) <= s4(0);
result(5) <= s5(0);
result(6) <= s6(0);
result(7) <= s7(0);
result(8) <= s7(1);
result(9) <= s7(2);
result(10) <= s7(3);
result(11) <= s7(4);
result(12) <= s7(5);
result(13) <= s7(6);
result(14) <= s7(7);
result(15) <= t7(7);

end Behavioral;
