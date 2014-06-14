
#include "constants.hpp"

_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
_lastFix = _gpsMem select 0;

_errorRate = "";
if (((NAMESPACE getVariable "smgrSettingsOpMod") select 0) == "STBY") then {
	_msf = time - (_lastFix select 0);
	_strMsf = [_msf] call SMGR_fnc_FormatMSF;

	if (NAMESPACE getVariable ["smgrErrorStr","dist"] == "dist") then {
		_errorRate = _strMsf;
		NAMESPACE setVariable ["smgrErrorStr","msf"];
	} else {
		_errorRate = format ["+%1m", _lastFix select 2];
		NAMESPACE setVariable ["smgrErrorStr","dist"];
	};
} else {
	_errorRate = format ["+%1m", _lastFix select 2];
};

_errorRate;