#include "constants.hpp"
private [
	"_gpsMem",
	"_lastFix",
	"_myPos",
	"_myAltitude"
];

_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;
_myPos = _lastFix select 1;

_myAltitude = _myPos select 2;

_myAltitude ;