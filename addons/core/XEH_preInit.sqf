#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"


// CBA EVENTS

[QGVAR(EH_execQFUNC), { _this#0 call (missionNamespace getVariable [_this#1, {}]); }] call CBA_fnc_addEventHandler;

[QGVAR(EH_ropeSetMass), FUNC(ropeSetMass)] call CBA_fnc_addEventHandler;

[QGVAR(EH_customHint), FUNC(customHint)] call CBA_fnc_addEventHandler;

[QGVAR(EH_customHideObjectGlobal), FUNC(customHideObjectGlobal)] call CBA_fnc_addEventHandler;
