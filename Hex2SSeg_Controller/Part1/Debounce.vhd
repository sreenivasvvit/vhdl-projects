--------------------------------------------
-- Module Name:    debounce - clean_pulse --
--------------------------------------------

-- Button debounce circuit;
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY debounce IS
    PORT (
      clk       : IN STD_LOGIC; ---make it low frequency
      key       : IN STD_LOGIC;  -- active low input
      pulse     : OUT STD_LOGIC);
END debounce;

ARCHITECTURE clean_pulse OF debounce IS
  SIGNAL cnt       : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
BEGIN
  PROCESS (clk,key)
  BEGIN
    IF key = '1' THEN
      cnt <= "00";
    ELSIF (clk'EVENT AND clk = '1') THEN
      IF (cnt /= "11") THEN cnt <= cnt + 1; END IF;
    END IF;
    IF (cnt = "10") AND (key = '0') THEN pulse <= '1'; ELSE pulse <= '0'; END IF;
  END PROCESS;
END clean_pulse;

