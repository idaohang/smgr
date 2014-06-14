
#include "constants.hpp"

_wpTempEdit = NAMESPACE getVariable "smgrWpTempEdit";

_wp = _wpTempEdit select 0;
_wpDist = _wpTempEdit select 1;
_wpAz = _wpTempEdit select 2;
_wpName = _wp select 0;
_wpIndex = _wp select 1;
_wpPos = _wp select 2;
_myPos = getPos player;

// if grid was not specified, calculate pos with dir and az
if ((count _wpPos) == 0) then
{
	_wpPos = [_myPos ,_wpDist, _wpAz] call BIS_fnc_relPos;
};

// build new wp
_newWp = [_wpName,_wpIndex,_wpPos];


// insert or edit
if (_wpIndex == count _wpList) then {
	[_newWp] call SMGR_fnc_WpInsert;
} else {
	[_newWp] call SMGR_fnc_WpReplace;
};


// go back to wp list
[DLG_SMGR_ScreenWplist_IDC] call SMGR_fnc_MgmtActivateController;