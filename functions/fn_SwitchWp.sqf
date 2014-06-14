#include "controls.h"
disableSerialization;

_offset = _this select 0;
_dlg = findDisplay DLG_SMGR_IDD;
_wpList = missionNamespace getVariable ["smgrWpList",[]];

if ((count _wpList) > 0) then {
	switch _offset do
	{
	    case "next": { _wpList = [_wpList,"left"] call SMGR_fnc_arrayRotate; };
	    case "prev": { _wpList = [_wpList,"right"] call SMGR_fnc_arrayRotate; };
	    default {};
	};

	missionNamespace setVariable ["smgrWpList",_wpList];
};