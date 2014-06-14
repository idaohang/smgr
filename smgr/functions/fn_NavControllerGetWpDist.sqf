
#include "constants.hpp"

_wp = _this select 0;
_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;

_wpPos = _wp select 2;
_myPos = _lastFix select 1;

_wpDist = [_myPos, _wpPos] call BIS_fnc_distance2D;

_wpDist;