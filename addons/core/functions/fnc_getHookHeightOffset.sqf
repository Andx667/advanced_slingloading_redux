#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to get the Hook Offset
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_vehicleClass"];


private _map = missionNamespace getVariable QGVAR(hookOffsetCache);

if (isNil "_map") then {
    _map = createHashMap;
    missionNamespace setVariable [QGVAR(hookOffsetCache), _map];

    private _configs = "true" configClasses (configFile >> QPVAR(Hooks_HeightOffset));
    {
        private _class = configName _x;
        private _entry = createHashMapFromArray [
            //[ "className", _class],
            [ "blockInheritance", getNumber (_x >> "blockInheritance") ],
            [
                "offsetArray",
                [
                    getNumber (_x >> "front"),
                    getNumber (_x >> "center"),
                    getNumber (_x >> "rear")
                ]
            ]
        ];
        _map set [_class, _entry];
    } forEach _configs;
};


// Check if _vehicleClass represented directly, if so return OffsetArray
if (_vehicleClass in keys _map) exitWith { _map get _vehicleClass get "offsetArray" };


// Check if _vehicleClass inherits from any of the entries (while inheritance isnt blocked)
// If multiple Entries, it will use the "closest relative"

private _parents = [(configOf _vehicleClass), true] call BIS_fnc_returnParents apply { toLowerANSI _x };
private _relatives = [];
{
    private _key = _x;
    private _entry = _y;

     if ( toLowerANSI _key in _parents && { _entry get "blockInheritance" isEqualTo 0 } ) then {

    };
} forEach _map;
