library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity par_Cphase is
	port (
		run_parity :  in std_logic;                                               -- c-phase operation runs while this is "1"
		clk :         in std_logic;
		QB1_sig :     out std_logic_vector(15 downto 0) :="0111111111111111";     -- QuBit1
		QB2_sig :     out std_logic_vector(15 downto 0) :="0111111111111111";     -- QuBit2
		anc_sig :     out std_logic_vector(15 downto 0) :="0111111111111111");    -- Ancilla
	end par_Cphase;
	
architecture Behavioral of par_Cphase is
begin
	process (clk, run_parity)
	begin
	if rising_edge(clk) then
		if run_parity = '1' then
			QB1_sig <= "1000110011001100"; -- 100 mV
			QB2_sig <= "1000110011001100"; -- 100 mV
			anc_sig <= "1001100101111001"; -- 200 mV
		else
			QB1_sig <= "0111111111111111"; -- 0 mV
			QB2_sig <= "0111111111111111"; -- 0 mV
			anc_sig <= "0111111111111111"; -- 0 mV
		end if;
	end if;
	end process;
end Behavioral;