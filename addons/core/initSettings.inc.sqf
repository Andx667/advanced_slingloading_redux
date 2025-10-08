/*
here, you put in your CBA Settings so they are available in the editor!

https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod

MACROS Used:
SETLSTRING(test) -> [LSTRING(set_test), LSTRING(set_test_desc)] -> STR_prefix_component_set_test // STR_prefix_component_set_test_desc


SET(test) -> ADDON_set_test
QSET(test) -> "ADDON_set_test"
*/

/*
[
	QSET(enable),							//    _setting     - Unique setting name. Matches resulting variable name <STRING>
	"CHECKBOX",								//    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
	SETLSTRING(enable),     				//    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	[LSTRING(set_cat_main)],				//    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
	true,									//    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>
	1,										//    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
	{},										//    _script      - Script to execute when setting is changed. (optional) <CODE>
	false									//    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
*/

//Global On/Off Switch
[
    QSET(enable),
    "CHECKBOX",
    SETLSTRING(enable),
    [LSTRING(set_cat_main)],
    true,
    1,
    {},
    false
] call CBA_fnc_addSetting;

//Ignores the lift capacity of the airframe and lets it lift anything
//needs the adjust mass function to dynamicly adapt cargo mass to airframe capacity
//was "heavy lifting" in the old version + setmass to staticly adjust the mass of cargo
[
    QSET(ignore_liftCapacity),
    "CHECKBOX",
    SETLSTRING(ignore_liftCapacity),
    [LSTRING(set_cat_main)],
    false,
    1,
    {},
    false
] call CBA_fnc_addSetting;

//Allow lifting of locked vehicles? And Allow locked vehicles to deploy ropes?
[
    QSET(allow_locked),
    "CHECKBOX",
    SETLSTRING(allow_locked),
    [LSTRING(set_cat_main)],
    false,
    1,
    {},
    false
] call CBA_fnc_addSetting;

//Allow slingloading only of certain vehicle types
[
    QSET(supportedVehicles),
    "LIST",
    SETLSTRING(supportedVehicles),
    [LSTRING(set_cat_main)],
    [[0,1,2], [LSTRING(supportedVehicles_all), LSTRING(supportedVehicles_heli), LSTRING(supportedVehicles_vtol)], 0], //0 = Helicopter + VTOL, 1 = Helicopter only, 2 = VTOL only
    1,
    {},
    false
] call CBA_fnc_addSetting;


//
/* [
    QSET(can_lift),
    "LIST",
    SETLSTRING(ignore_liftCapacity),
    [LSTRING(set_cat_main)],
    false,
    ["Helicopter", "VTOL", "Helicopter + VTOL"],
    {},
    false
] call CBA_fnc_addSetting; */

//can be lifted
/* [
    QSET(can_be_lifted),
    "LIST",
    SETLSTRING(can_be_lifted),
    [LSTRING(set_cat_main)],
    false,
    ["Car", "Tank", "Car + Tank", "All"], //What class would cargo crates/boxes go into?, what about other helicopters?
    {},
    false
] call CBA_fnc_addSetting; */
