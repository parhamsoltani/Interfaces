-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 interface descriptions for BiSS (Bidirectional/Serial/Synchronous)
--
-- Description:
--   https://en.wikipedia.org/wiki/BiSS_interface
--   https://biss-interface.com/
--
-- License:
-- =============================================================================
-- Copyright 2026-2026 Open Source VHDL Group
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

package BiSS is
	type BiSS_PcbInterface is record
		Clock    : std_logic;

		DataOut  : std_logic;
		DataIn   : std_logic;
	end record;
	type BiSS_PcbInterface_Vector is array(natural range <>) of BiSS_PcbInterface;

	view BiSS_ControllerView of BiSS_PcbInterface is
		Clock    : out;

		DataOut  : out;
		DataIn   : in;
	end view;
	alias BiSS_DeviceView is BiSS_ControllerView'converse;
end package;
