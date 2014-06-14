
#include "constants.hpp"

_opMod = NAMESPACE getVariable "smgrSettingsOpMod";
_opMod = [_opMod] call SMGR_fnc_arrayRotate;
NAMESPACE setVariable ["smgrSettingsOpMod", _opMod];