_idx = _this select 0;

_wplist = missionNamespace getVariable ["smgrWpList", []];
_wp = ["",(count _wpList),[]];
{
	if ((_x select 1)==_idx) then {
		_wp = _x;
	};
} forEach _wpList;
[_wp,0,0] call SMGR_fnc_EditWp;