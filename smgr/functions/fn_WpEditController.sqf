/*
    File: fn_ControllerWpEdit.sqf
    Author: <G.I.D> Sacha

    Description:
    Controls the view for editing a waypoint
    Builds and array of strings to be displayed in fields and updates the view

    Parameters:
    0: Index of waypoint to edit (number)

    Returns:
    nothing
*/

#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"

// activate controller and view
[ControllerWpEdit] call SMGR_fnc_MgmtAssignKeyActions;
[ControllerWpEdit] call SMGR_fnc_MgmtActivateController;
[ControllerWpEdit] call SMGR_fnc_MgmtActivateView;

_wpIdx = _this select 0;

_wpList = NAMESPACE getVariable ["smgrWpList",[]];

// create temporary edit data
_wpDist = 0;
_wpAz = 0;
_wp = [];
	// check if we're editing an existing waypoint or creating a new one
if (_wpIdx == count _wpList) then {
	_wp = ["",_wpIdx,[]];
} else {
	{
		_idx = _x select 1;
		if (_idx == _wpIdx) then {
			_wp = _x;
		};
	} forEach _wpList;
};
NAMESPACE setVariable ["smgrWpTempEdit",[_wp,_wpDist,_wpAz]];

// update view with temporary data
while {IsActiveController(ControllerWpEdit)} do {
	_wpTempEdit = NAMESPACE getVariable "smgrWpTempEdit";

	_wp = _wpTempEdit select 0;
	_wpDist = _wpTempEdit select 1;
	_wpAz = _wpTempEdit select 2;

	_wpName = _wp select 0;
	_wpIndex = _wp select 1;
	_wpPos = _wp select 2;

	//pos
	_strWpPos = "";
	if (count _wpPos == 0) then {
		_strWpPos = "n/a";
	}else{
		_strWpPos = [_wpPos] call SMGR_fnc_FormatPos;
	};

	//dist
	_strWpDist = [_WpDist,false] call	SMGR_fnc_FormatDist;

	// update view
	[_wpIndex,_wpName,_strWpPos ,_strWpDist,_wpAz] call SMGR_fnc_ViewWpEdit;

};

[ControllerWpEdit] call SMGR_fnc_MgmtDeactivateView;