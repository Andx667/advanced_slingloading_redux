#include "script_component.hpp"

call FUNC(init);

_id0 = [QGVAR(ropeShortendEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id1 = [QGVAR(ropeRetractedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id2 = [QGVAR(cargoReleasedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id3 = [QGVAR(ropePickedupEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id4 = [QGVAR(ropeDroppedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id5 = [QGVAR(ropeExtentedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id6 = [QGVAR(ropeDeployedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
_id7 = [QGVAR(ropeAttachedEvent), {systemChat str _this}] call CBA_fnc_addEventHandler;
