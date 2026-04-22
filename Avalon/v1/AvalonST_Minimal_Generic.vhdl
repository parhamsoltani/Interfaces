-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Generic minimal Avalon Streaming interface for pre-constraining widths
--
-- Description:
--   Provides sized versions of the minimal Avalon ST interface
--
-- License:
-- =============================================================================
-- Copyright 2025-2026 Open Source VHDL Group
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

use work.AvalonST_Minimal.all;

package AvalonST_Minimal_Generic is
	generic (
		constant DATA_BITS : positive
	);

	-- Sized minimal interface
	subtype AvalonST_Minimal_SizedInterface is AvalonST_Minimal_Interface(
		Data(DATA_BITS - 1 downto 0)
	);

	subtype AvalonST_Minimal_SizedInterface_Vector is AvalonST_Minimal_Interface_Vector(open)(
		Data(DATA_BITS - 1 downto 0)
	);

end package;
