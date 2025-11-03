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
* [typeOf cursorObject] call asr_core_fnc_getHooksData
*
* Public: No
*/


params [ ["_vehicleObj", objNull, [objNull]] ];

if (isNull _vehicleObj) exitWith {};

private _vehicleClass = typeOf _vehicleObj;

INFO_1("(HookData)(Start)Check for %1",_vehicleClass);

// 1. Check If Classname has already been cached

private _cache = missionNamespace getVariable QGVAR(Cache_HooksData);

if (isNil "_cache") then {
    _cache = createHashMap;
    missionNamespace setVariable [QGVAR(Cache_hooksData), createHashMap];
};

if (_vehicleClass in keys _cache) then {
    INFO("(HookData)(Done) Found cached data!");
    _cache get _vehicleClass    // return
} else {
    INFO("(HookData)(Getting) No cached data - checking for config entry");
    // 2. Check if Vehicle has configDefined Hooks
    private _hookEntries = [_vehicleClass] call FUNC(getHooksFromConfig);

    if (isNil "_hookEntries") then {
        INFO("(HookData)(Getting) No config entry - calculating default hooks");

        _hookEntries = [];
        // No Predefined Hooks found, therefore get the Default Hooks
        private _arrayOfOffsets = [_vehicleObj] call FUNC(getHooksDefault);

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
            QEGVAR(hook,center),
            "Center",                           // ToDo: Use LSTRING
            _numOfHooks isEqualTo 2,            // isExclusive
            _arrayOfOffsets select 0 select 0
        ] call _addHookEntry;

        if (_numOfHooks isEqualTo 1) exitWith {};

        // Handle Front
        [
            QEGVAR(hook,front),
            "Front",                            // ToDo: Use LSTRING
            false,
            _arrayOfOffsets select 1 select 0
        ] call _addHookEntry;

        // Handle Rear
        [
            QEGVAR(hook,rear),
            "Rear",                            // ToDo: Use LSTRING
            false,
            _arrayOfOffsets select 1 select 1
        ] call _addHookEntry;

    };

    // Get Hook Index - From Front to Rear
    _hookEntries = [_hookEntries, [], { _x get "hookOffset" select 1 }, "DESCEND"] call BIS_fnc_sortBy;
    { _x set ["hookIndex", _forEachIndex] } forEach _hookEntries;


    // Create Helicopter Hook Data
    private _numOfHooks = count _hookEntries;
    private _hasExclusive = false;
    private _hooks = createHashMap;
    private _hookIDs = [];
    {
        private _hookID = _x get "hookClassname";
        if (_x get "isExclusive") then { _hasExclusive = _hookID; };
        _hooks set [ _hookID , _x ];
        _hookIDs pushBack _hookID;          // ([QPREFIX, "hook", _hookID] joinString "_");
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

    INFO("(HookData)(Done) Data cached!");

    _hooksData  // return

}
