#include "..\script_component.hpp"
/*
 * Authors: Andx, sethduda
 * Description.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call aslr_core_fnc_deployRopesActionCheck
 *
 * Public: No
 */

if(isNull objectParent ACE_player) then {
    [cursorTarget] call FUNC(canDeployRopes);
} else {
    [vehicle ACE_player] call FUNC(canDeployRopes);
};
