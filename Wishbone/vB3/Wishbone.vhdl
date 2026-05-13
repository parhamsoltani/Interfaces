-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   VHDL-2019 Wishbone interface descriptions
--
-- Description:
--   Signal names use full descriptive UpperCamelCase names for clarity
--
-- License:
-- =============================================================================
-- Copyright 2025-2025 Open Source VHDL Group
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

use     work.WishboneCommon.all;

package Wishbone is
	-- Tag Interface for optional tag signals
	type Wishbone_Tag_Interface is record
		Cycle   : Tag_Cycle_Type;
		Address : Tag_Address_Type;
		DataOut : Tag_Data_Type;
		DataIn  : Tag_Data_Type;
	end record;

	-- Full Wishbone Interface (using descriptive full names)
	type Wishbone_Interface is record
		-- Master signals (outputs from master perspective)
		Cycle       : std_ulogic;     -- CYC_O - Cycle
		Strobe      : std_ulogic;     -- STB_O - Strobe
		WriteEnable : std_ulogic;     -- WE_O  - Write Enable
		Address     : Address_Type;   -- ADR_O - Address
		DataOut     : Data_Type;      -- DAT_O - Data (Master to Slave)
		ByteSelect  : Select_Type;    -- SEL_O - Byte select
		
		-- Slave signals (outputs from slave perspective)
		Acknowledge : std_ulogic;     -- ACK_I - Acknowledge
		Error       : std_ulogic;     -- ERR_I - Error
		Retry       : std_ulogic;     -- RTY_I - Retry
		DataIn      : Data_Type;      -- DAT_I - Data (Slave to Master)
		
		-- Optional signals for pipelined/burst modes
		CycleType   : CycleType_Type; -- CTI_O - Cycle Type Identifier
		BurstType   : BurstType_Type; -- BTE_O - Burst Type Extension
		
		-- Optional signals
		Tag         : Wishbone_Tag_Interface;
		Lock        : std_ulogic;     -- LOCK_O - Lock
		Stall       : std_ulogic;     -- STALL_I - Pipeline stall
	end record;
	type Wishbone_Interface_Vector is array(natural range <>) of Wishbone_Interface;

	-- Master view (from master's perspective)
	view Wishbone_MasterView of Wishbone_Interface is
		-- Master outputs
		Cycle       : out;
		Strobe      : out;
		WriteEnable : out;
		Address     : out;
		DataOut     : out;
		ByteSelect  : out;
		CycleType   : out;
		BurstType   : out;
		Tag         : out;
		Lock        : out;
		
		-- Master inputs (slave outputs)
		Acknowledge : in;
		Error       : in;
		Retry       : in;
		DataIn      : in;
		Stall       : in;
	end view;
	alias Wishbone_SlaveView is Wishbone_MasterView'converse;

	-- Simplified interface without optional signals
	type Wishbone_Simple_Interface is record
		-- Master signals
		Cycle       : std_ulogic;
		Strobe      : std_ulogic;
		WriteEnable : std_ulogic;
		Address     : Address_Type;
		DataOut     : Data_Type;
		ByteSelect  : Select_Type;
		
		-- Slave signals
		Acknowledge : std_ulogic;
		DataIn      : Data_Type;
	end record;
	type Wishbone_Simple_Interface_Vector is array(natural range <>) of Wishbone_Simple_Interface;

	view Wishbone_Simple_MasterView of Wishbone_Simple_Interface is
		-- Master outputs
		Cycle       : out;
		Strobe      : out;
		WriteEnable : out;
		Address     : out;
		DataOut     : out;
		ByteSelect  : out;
		
		-- Master inputs
		Acknowledge : in;
		DataIn      : in;
	end view;
	alias Wishbone_Simple_SlaveView is Wishbone_Simple_MasterView'converse;

end package;
