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

// Cache
if (isNil "_map") then {
    _map = createHashMap;
    missionNamespace setVariable [QGVAR(hookOffsetCache), _map];

    private _configs = "true" configClasses (configFile >> QPVAR(Hooks_HeightOffset));
    {
        private _class = configName _x;
        private _entry = createHashMapFromArray [
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
// "All" will always be a relative, making it the default

private _parents = [ configFile >> "CfgVehicles" >> _vehicleClass, true ] call BIS_fnc_returnParents apply { toLowerANSI _x };

private _relatives = [];
{
    private _key = _x;
    private _entry = _y;

    private _index = _parents find toLowerANSI _key;
     if ( _index isNotEqualTo -1 && { _entry get "blockInheritance" isEqualTo 0 } ) then {
        // Add entry to relatives
        // The smaller the index, the closer related
        _relatives pushBack [_index, _entry get "offsetArray"];
    };
} forEach _map;

// return closest relative OffsetArray
_relatives = [_relatives, [], { _x#0 }] call BIS_fnc_sortBy;
_relatives select 0 select 1
