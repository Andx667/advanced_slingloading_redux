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

params ["_vehicle", "_cargo"];

private _canSling = false;

if ( !isNull _vehicle && { !isNull _cargo }) then {//ToDo check not
    {
        if (_vehicle isKindOf (_x select 0)) then {
            if (_cargo isKindOf (_x select 2)) then {
                if ((toUpper (_x select 1)) == "CAN_SLING") then { //ToDo simplify
                    _canSling = true;
                } else {
                    _canSling = false;
                };
            };
        };
    } forEach (missionNamespace getVariable [QGVAR(Sling_Rules_OVERRIDE), GVAR(Sling_Rules)]);
};

_canSling;
