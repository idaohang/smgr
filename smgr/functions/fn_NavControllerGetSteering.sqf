
#include "constants.hpp"

_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;
_lboFix = _gpsMem select 1;

_myPos = _lastFix select 1;
_lastPos = _lboFix select 1;

_mySteering = [_lastPos, _myPos] call BIS_fnc_dirTo;
if (_mySteering < 0) then {_mySteering = 360 + _mySteering;};
if ([_myPos,_lastPos] call BIS_fnc_arrayCompare) then { _mySteering = -1; };

_mySteering;