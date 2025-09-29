#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"


// CBA EVENTS

[QGVAR(EH_customHint),             FUNC(customHint)            ] call CBA_fnc_addEventHandler;
[QGVAR(EH_ropeSetMass),            FUNC(ropeSetMass)           ] call CBA_fnc_addEventHandler;


[ QGVAR(EH_hideObjectGlobal), { params ["_obj", ["_bool", true]]; _obj hideObjectGlobal _bool;  }                     ] call CBA_fnc_addEventHandler;
[ QGVAR(EH_execQFUNC),        { _this select 0 call ( missionNamespace getVariable [ _this select 1, { true } ] ) }   ] call CBA_fnc_addEventHandler;
