_wpList = missionNamespace getVariable ["smgrWpList",[]];
_markCount = missionNamespace getVariable ["smgrMarkCount",0];
_markCount = _markCount+1;
missionNamespace setVariable ["smgrMarkCount",_markCount];

_pos = getPosASL player;
_markName = format ["MARK-%1", _markCount];

_wp = [_markName,(count _wpList),_pos];

//wplist might not be ordered so we have to find the index at wich to insert the new wp
_insertIdx = 0;
{
	if ((_x select 1) == ((count _wpList)-1)) then {
		_insertIdx = _foreachIndex + 1;
	};
} forEach _wpList;

if (_insertIdx >= (count _wpList)) then {
	[_wpList,_wp] call BIS_fnc_arrayPush;
} else {
	_wpList = [_wpList, [_wp], _insertIdx] call BIS_fnc_arrayInsert;
};

missionNamespace setVariable ["smgrWpList",_wpList];