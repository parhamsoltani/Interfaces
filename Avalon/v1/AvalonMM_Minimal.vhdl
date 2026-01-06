-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Minimal Avalon Memory-Mapped interface
--
-- Description:
--   Simplified Avalon MM interface without optional signals for basic use cases
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

use     work.AvalonCommon.all;

package AvalonMM_Minimal is
	-- Minimal Avalon MM interface (only essential signals)
	type AvalonMM_Minimal_Interface is record
		-- Master signals
		Address     : Address_Type;
		Read        : std_ulogic;
		Write       : std_ulogic;
		WriteData   : Data_Type;
		ByteEnable  : ByteEnable_Type;
		
		-- Slave signals
		ReadData    : Data_Type;
		WaitRequest : std_ulogic;
	end record;
	type AvalonMM_Minimal_Interface_Vector is array(natural range <>) of AvalonMM_Minimal_Interface;

	-- Master view
	view AvalonMM_Minimal_MasterView of AvalonMM_Minimal_Interface is
		-- Master outputs
		Address     : out;
		Read        : out;
		Write       : out;
		WriteData   : out;
		ByteEnable  : out;
		
		-- Master inputs (slave outputs)
		ReadData    : in;
		WaitRequest : in;
	end view;
	alias AvalonMM_Minimal_SlaveView is AvalonMM_Minimal_MasterView'converse;

end package;
