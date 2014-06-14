_gpsMem = missionNamespace getVariable ["smgrGpsMemory", [(getPosASL player),(getPosASL player)]];
_pos = [getPosASL player] call SMGR_fnc_GpsApplyError;

_gpsMemNew = [_pos];

[_gpsMemNew, _gpsMem] call BIS_fnc_arrayPushStack;
if ((count _gpsMemNew) > 10) then { _gpsMemNew call BIS_fnc_arrayPop; };

_gpsMemNew;