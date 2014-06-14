#include "constants.hpp"

_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;
_lboFix = _gpsMem select 1;

_myPos = _lastFix select 1;
_lastPos = _lboFix select 1;

_grid = [_myPos] call SMGR_fnc_mapGridPosition;

_grid;