#include "\z\asr\addons\main\data\hpp\defineDIKCodes.hpp"

/*
[
    _category, QGVAR(key_doTheThing),
    [LSTRING(doTheThing_name), LSTRING(doTheThing_tooltip)], {
        // ...
    }, {}, [DIK_KEYNAME, _shift, _ctrl, _alt] // Default keybind
] call CBA_fnc_addKeybind;
*/

[
    _category, QGVAR(key_emergencyCargoRelease),
    [LSTRING(keys_emergencyCargoRelease_name), LSTRING(keys_emergencyCargoRelease_tooltip)], {
        //key down

        // Check if player is allowed Seat

        if ([ACE_player] call FUNC(emergencyRelease_condition)) then {
            [ACE_player] call FUNC(emergencyRelease_statement);
        };

    }, {
        //key up
    },
    [DIK_J, true, false, false] // Default keybind
] call CBA_fnc_addKeybind;
