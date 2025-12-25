#include "\z\asr\addons\main\data\hpp\defineDIKCodes.hpp"
#include "..\script_component.hpp"

/*
* Author: Zorn
* Ace Action Statement for "Pick Up Ropes" Action
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* [cursorObject, player] call asr_core_fnc_aa_pickupRopes_statement;
*
* Public: No
*/

params ["_ropeHelper", "_player", "_params"];
_params params  [""];

[_ropeHelper, _player] call FUNC(ropesPickup);
