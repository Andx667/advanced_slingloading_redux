// ["SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"]
// configOf cursorObject >> "slingLoadCargoMemoryPoints"
//

#include "..\script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to Get the Sling Load points of an Object, if non are defined, use Corner Points instead.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [cursorObject] call asr_core_fnc_cargo_getSlingloadPoints
 *
 * Public: No
*/

params [ "_cargo" ];

private _slingLoadPoints = getArray ( configOf _cargo >> "slingLoadCargoMemoryPoints" );

if (_slingLoadPoints isEqualTo []) exitWith { [ _cargo ] call FUNC(cargo_getCornerPoints) };

_slingLoadPoints apply { _cargo selectionPosition _x }
