-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Minimal Avalon Streaming interface
--
-- Description:
--   Simplified Avalon ST interface without optional signals for basic streaming
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

package AvalonST_Minimal is
	-- Minimal Avalon ST interface (only essential signals)
	type AvalonST_Minimal_Interface is record
		-- Source signals
		Data  : Data_Type;
		Valid : std_ulogic;
		
		-- Sink signals
		Ready : std_ulogic;
	end record;
	type AvalonST_Minimal_Interface_Vector is array(natural range <>) of AvalonST_Minimal_Interface;

	-- Source view
	view AvalonST_Minimal_SourceView of AvalonST_Minimal_Interface is
		-- Source outputs
		Data  : out;
		Valid : out;
		
		-- Source inputs (sink outputs)
		Ready : in;
	end view;
	alias AvalonST_Minimal_SinkView is AvalonST_Minimal_SourceView'converse;

end package;
