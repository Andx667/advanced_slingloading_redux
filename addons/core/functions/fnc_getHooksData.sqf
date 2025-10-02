#include "..\script_component.hpp"

/*
* Author: Zorn
* Function to get the Hooks / Sling Load Points.
*
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

params [ "_vehicleClass" ];


// 1. Check If Classname has already been cached    // Could use a cba namespace for public caching but meh, will cause network messages even to clients who dont care and vehicle init will already broadcast active data

private _cache = missionNamespace getVariable QGVAR(Cache_HooksData);

if (isNil "_cache") then {
    private _cache = createHashMap;
    missionNamespace setVariable [QGVAR(Cache_hooksData), createHashMap];
};

if (_vehicleClass in keys _cache) then {

    _cache get _vehicleClass    // return

} else {

    // 2. Check if Vehicle has configDefined Hooks
    private _hookEntries = [_vehicleClass] call FUNC(getHooksFromConfig);

    if (isNil "_hookEntries") then {
        _hookEntries = [];

        // No Predefined Hooks found, therefore get the Default Hooks
        private _arrayOfOffsets = [_vehicleClass] call FUNC(getHooksFromConfig);

        // Turn OldSchool Offsets into HookEntries
        private _numOfHooks = count _arrayOfOffsets;

        if (_numOfHooks isEqualTo 0) exitWith {};

        private _addHookEntry = {
            params [ "_className", "_displayName", "_hasExclusive", "_offsetArray" ];
            _hookEntries pushBack createHashMapFromArray [
                [ "hookClassname", _className    ],
                [ "displayName",   _displayName  ],
                [ "isExclusive",   _hasExclusive ],
                [ "hookOffset",    _offsetArray  ]
            ];
        };

        // handle Center Hook
        [
            "center",
            "Center",                           // ToDo: Use LSTRING
            _numOfHooks isEqualTo 2,            // isExclusive
            _arrayOfOffsets select 0 select 0
        ] call _addHookEntry;

        if (_numOfHooks isEqualTo 1) exitWith {};

        // Handle Front
        [
            "front",
            "Front",                            // ToDo: Use LSTRING
            false,
            _arrayOfOffsets select 1 select 0
        ] call _addHookEntry;

        // Handle Rear
        [
            "rear",
            "Rear",                            // ToDo: Use LSTRING
            false,
            _arrayOfOffsets select 1 select 1
        ] call _addHookEntry;

    };

    // Create Helicopter Hook Data
    private _numOfHooks = count _hookEntries;
    private _hasExclusive = false;
    private _hooks = createHashMap;
    private _hookIDs = [];
    {
        if (_x get "isExclusive") then { _hasExclusive = true; };
        private _hookID = _x get "hookClassname";
        _hooks set [ _hookID , _x ];
        _hookIDs pushBack (format [QPREFIX, "hook", _hookID] joinString "_");
    } forEach _hookEntries;

    // This is read only data - meaning it will be applied once publically but never updated.
    // Any data that is to be updated will be added as a seperate object variable to reduce networkmessage size on update.
    private _hooksData = createHashMapFromArray [
        ["hasExclusiveHook", _hasExclusive],
        ["hookIDs", _hookIDs],
        ["hooks", _hooks]
    ];

    // store data in cache
    _cache set [_vehicleClass, _hooksData];

    _hooksData  // return

}
