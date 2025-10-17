#include "..\script_component.hpp"

/*
* Author: Zorn
* FNC to get Hooks from Config
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

private _map = missionNamespace getVariable QGVAR(Cache_HooksFromConfig);

// Cache all Config Defined Hooks
if (isNil "_map") then {
    _map = createHashMap;
    missionNamespace setVariable [QGVAR(Cache_HooksFromConfig), _map];


    private _configs = "true" configClasses (configFile >> QPVAR(hooks));

    {
        private _vehicleCfgClass = configName _x;
        private _hookEntries = [];

        private _hookConfigs = "true" configClasses _x;

        {
            private _hookClassname = configName _x;
            private _prefix = format ["%1_hook",QPREFIX];
            if !( _prefix in _hookClassname ) then { _hookClassname = [_prefix, _hookClassname] joinString "_"; };

            // Create Hashmap per Hook
            _hookEntries pushBack createHashMapFromArray [
                [ "hookClassname", _hookClassname                              ],
                [ "displayName",   getText (_x >> "displayName")               ],
                [ "isExclusive",   getNumber (_x >> "isExclusive") isEqualTo 1 ],
                [
                    "hookOffset",
                    [
                        getNumber (_x >> "x"),
                        getNumber (_x >> "y"),
                        getNumber (_x >> "z")
                    ]
                ]
            ];

        } forEach _hookConfigs;

        // write entry to cache
        _map set [
            _vehicleCfgClass,
            createHashMapFromArray [
                [ "blockInheritance", getNumber (_x >> "blockInheritance") ],
                [ "hooks", _hookEntries ]
            ]
        ];

    } forEach _configs;
};

// Check if _vehicleClass represented directly, if so return array of Hooks-entries.
if (_vehicleClass in keys _map) exitWith { _map get _vehicleClass get "hooks" };

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
        _relatives pushBack [_index, _entry get "hooks"];
    };
} forEach _map;

if (_relatives isEqualTo []) exitWith { nil };

// return array of hooks-entries from closest relative
_relatives = [_relatives, [], { _x select 0 }] call BIS_fnc_sortBy;
_relatives select 0 select 1
