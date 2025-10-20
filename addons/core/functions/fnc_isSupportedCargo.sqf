#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Checks if the cargo is allowed to be sling loaded.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo <OBJECT>
 *
 * Return Value:
 * True if the cargo is allowed to be slingloaded, False otherwise
 *
 * Example:
 * [vehicle, cargo] call aslr_core_fnc_isSupportedCargo
 *
 * Public: No
 */

// ToDo Rework?

params [
    [ "_vehicle", objNull, [objNull] ],
    [ "_cargo",   objNull, [objNull] ]
];

if ( isNull _vehicle || { isNull _cargo }) exitWith { false };

private _rules = missionNamespace getVariable [QGVAR(Sling_Rules_OVERRIDE), GVAR(Sling_Rules)];

// Check if there is rule against it
_rules findIf {
    "CAN_NOT_SLING" isEqualTo toUpper (_x select 1)
    &&
    {
        _vehicle isKindOf (_x select 0)
        &&
        {
            _cargo isKindOf (_x select 2)
        }
    }
} isEqualTo -1

&&

{
    // Check if there is a rule that allows it
    _rules findIf {
        "CAN_SLING" isEqualTo toUpper (_x select 1)
        &&
        {
            _vehicle isKindOf (_x select 0)
            &&
            {
                _cargo isKindOf (_x select 2)
            }
        }
    } isNotEqualTo -1
}
