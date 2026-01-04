#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"


// CBA EVENTS
[QGVAR(EH_initAirframe), FUNC(initAirframe) ] call CBA_fnc_addEventHandler;
[QGVAR(EH_monitorCargo), FUNC(monitorCargo) ] call CBA_fnc_addEventHandler;

[QGVAR(EH_customHint),   FUNC(customHint)   ] call CBA_fnc_addEventHandler;

[QGVAR(EH_setMass),      FUNC(setMass)      ] call CBA_fnc_addEventHandler;
[QGVAR(EH_handleMass),   FUNC(handleMass)   ] call CBA_fnc_addEventHandler;

[QGVAR(EH_detachRopesAction_client),   FUNC(ropesAttach_addActions_client) ] call CBA_fnc_addEventHandler;
[QGVAR(EH_detachRopesAction_server),   FUNC(ropesAttach_addActions_server) ] call CBA_fnc_addEventHandler;


[
    QGVAR(EH_cargoDetached),
    {
        params [ "_airframe", "_cargo", "_hookID" ];

        // Handle Cargo Mass
        private _originalMass = _cargo getVariable QGVAR(originalMass);
        if !( isNil _originalMass ) then {
            [ QGVAR(EH_setMass), [ _cargo, _originalMass ], _cargo ] call CBA_fnc_targetEvent;
        };


        // Set Cargo on hookMap
        private _hookMap = _airframe getVariable _hookID;
        _hookMap set ["cargo", objNull];
        _airframe setVariable [_hookID, _hookMap, true];


    }
] call CBA_fnc_addEventHandler;
