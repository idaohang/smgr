_gpsMem = missionNamespace getVariable ["smgrGpsMemory", [(getPosASL player),(getPosASL player)]];
_myPos = _gpsMem select 0;

_waypoints = missionNamespace getVariable ["smgrWpList",[]];
_wp = _waypoints select 0;
_wpName = _wp select 0;
_wpIdx = _wp select 1;
_wpPos = _wp select 2;

_wpGrid = [_wpPos] call SMGR_fnc_FormatPos;

_wpDir = [_myPos, _wpPos] call BIS_fnc_dirTo;
if (_wpDir < 0) then {_wpDir = 360 + _wpDir;};
_wpDir = [_wpDir] call SMGR_fnc_FormatAngle;

_wpDist = [_myPos, _wpPos] call BIS_fnc_distance2D;
_wpDist = [_wpDist] call SMGR_fnc_FormatDist;

switch true do
{
    case (_wpIdx < 10): {_wpIdx = format ["00%1", _wpIdx];};
    case ((_wpIdx >= 10)and(_wpIdx < 100)): {_wpIdx = format ["0%1", _northings];};
    case ((_wpIdx >= 100)and(_wpIdx < 1000)): {_wpIdx = format ["%1", _northings];};
    default {};
};

_wpNavData = [_wpIdx, _wpName, _wpGrid, _wpDir, _wpDist];
_wpNavData;