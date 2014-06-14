
#include "constants.hpp"

_wp = _this select 0;
_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;

_wpPos = _wp select 2;
_myPos = _lastFix select 1;

_wpDir = [_myPos, _wpPos] call BIS_fnc_dirTo;
if (_wpDir < 0) then {_wpDir = 360 + _wpDir;};

_wpDir;