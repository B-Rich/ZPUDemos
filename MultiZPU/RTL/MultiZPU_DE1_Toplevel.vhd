library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

library work;

entity MultiZPU_DE1_Toplevel is
	port
	(
		CLOCK_24		:	 in std_logic_vector(1 downto 0);
		CLOCK_27		:	 in std_logic_vector(1 downto 0);
		CLOCK_50		:	 in STD_LOGIC;
		EXT_CLOCK		:	 in STD_LOGIC;
		KEY		:	 in std_logic_vector(3 downto 0);
		SW		:	 in std_logic_vector(9 downto 0);
		HEX0		:	 out std_logic_vector(6 downto 0);
		HEX1		:	 out std_logic_vector(6 downto 0);
		HEX2		:	 out std_logic_vector(6 downto 0);
		HEX3		:	 out std_logic_vector(6 downto 0);
		LEDG		:	 out std_logic_vector(7 downto 0);
		LEDR		:	 out std_logic_vector(9 downto 0);
		UART_TXD		:	 out STD_LOGIC;
		UART_RXD		:	 in STD_LOGIC;
		DRAM_DQ		:	 inout std_logic_vector(15 downto 0);
		DRAM_ADDR		:	 out std_logic_vector(11 downto 0);
		DRAM_LDQM		:	 out STD_LOGIC;
		DRAM_UDQM		:	 out STD_LOGIC;
		DRAM_WE_N		:	 out STD_LOGIC;
		DRAM_CAS_N		:	 out STD_LOGIC;
		DRAM_RAS_N		:	 out STD_LOGIC;
		DRAM_CS_N		:	 out STD_LOGIC;
		DRAM_BA_0		:	 out STD_LOGIC;
		DRAM_BA_1		:	 out STD_LOGIC;
		DRAM_CLK		:	 out STD_LOGIC;
		DRAM_CKE		:	 out STD_LOGIC;
		FL_DQ		:	 inout std_logic_vector(7 downto 0);
		FL_ADDR		:	 out std_logic_vector(21 downto 0);
		FL_WE_N		:	 out STD_LOGIC;
		FL_RST_N		:	 out STD_LOGIC;
		FL_OE_N		:	 out STD_LOGIC;
		FL_CE_N		:	 out STD_LOGIC;
		SRAM_DQ		:	 inout std_logic_vector(15 downto 0);
		SRAM_ADDR		:	 out std_logic_vector(17 downto 0);
		SRAM_UB_N		:	 out STD_LOGIC;
		SRAM_LB_N		:	 out STD_LOGIC;
		SRAM_WE_N		:	 out STD_LOGIC;
		SRAM_CE_N		:	 out STD_LOGIC;
		SRAM_OE_N		:	 out STD_LOGIC;
		SD_DAT		:	 in STD_LOGIC;
		SD_DAT3		:	 out STD_LOGIC;
		SD_CMD		:	 out STD_LOGIC;
		SD_CLK		:	 out STD_LOGIC;
		TDI		:	 in STD_LOGIC;
		TCK		:	 in STD_LOGIC;
		TCS		:	 in STD_LOGIC;
		TDO		:	 out STD_LOGIC;
		I2C_SDAT		:	 inout STD_LOGIC;
		I2C_SCLK		:	 out STD_LOGIC;
		PS2_DAT		:	 in STD_LOGIC;
		PS2_CLK		:	 in STD_LOGIC;
		VGA_HS		:	 buffer STD_LOGIC;
		VGA_VS		:	 buffer STD_LOGIC;
		VGA_R		:	 out unsigned(3 downto 0);
		VGA_G		:	 out unsigned(3 downto 0);
		VGA_B		:	 out unsigned(3 downto 0);
		AUD_ADCLRCK		:	 out STD_LOGIC;
		AUD_ADCDAT		:	 in STD_LOGIC;
		AUD_DACLRCK		:	 out STD_LOGIC;
		AUD_DACDAT		:	 out STD_LOGIC;
		AUD_BCLK		:	 inout STD_LOGIC;
		AUD_XCK		:	 out STD_LOGIC;
		GPIO_0		:	 inout std_logic_vector(35 downto 0);
		GPIO_1		:	 inout std_logic_vector(35 downto 0)
	);
END entity;

architecture rtl of MultiZPU_DE1_Toplevel is

signal reset : std_logic;
signal sysclk : std_logic;
signal pll_locked : std_logic;


begin

--	All bidir ports tri-stated
FL_DQ <= (others => 'Z');
SRAM_DQ <= (others => 'Z');
I2C_SDAT	<= 'Z';
GPIO_0 <= (others => 'Z');
GPIO_1 <= (others => 'Z');
DRAM_DQ <= (others => 'Z');
DRAM_CKE <= '0';
DRAM_CS_N <= '1';

mypll : entity work.PLL
port map
(
	inclk0 => CLOCK_50,
	c0 => DRAM_CLK,
	c1 => sysclk,
	locked => pll_locked
);

reset<=(not SW(0) xor KEY(0)) and pll_locked;

greenleds: for i in 0 to 7 generate
	greenled : entity work.ZPU_LEDWrapper
		generic map
		(
			delay => i
		)
		port map
		(	
			clk => sysclk,
			reset_in => reset,
			led => LEDG(i)
		);
	end generate;


redleds: for i in 0 to 9 generate
	redled : entity work.ZPU_LEDWrapper
		generic map
		(
			delay => (i+8)
		)
		port map
		(	
			clk => sysclk,
			reset_in => reset,
			led => LEDR(i)
		);
	end generate;

hexleds: for i in 0 to 6 generate
	hexled : entity work.ZPU_LEDWrapper
		generic map
		(
			delay => (i+18)
		)
		port map
		(	
			clk => sysclk,
			reset_in => reset,
			led => HEX0(i)
		);
	end generate;

	hexled2 : entity work.ZPU_LEDWrapper
		generic map
		(
			delay => (25)
		)
		port map
		(	
			clk => sysclk,
			reset_in => reset,
			led => HEX1(0)
		);

end architecture;
