/*
    File: fn_ControllerNav.sqf
    Author: <G.I.D> Sacha

    Description:
    Updates the navigation view with relevant data.

    Parameters:
    none

    Returns:
    nothing
*/

#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"
private [
	"_steering",
	"_elevation",
	"_wpDir",
	"_wpName",
	"_curWpData",
	"_wpIdx",
	"_grid",
	"_date",
	"_opMod",
	"_powerLeft",
	"_curPosData",
	"_wpDist",
	"_curWp",
	"_errorRate",
	"_wpGrid"
];

while {IsActiveController("NavController")} do {
	_curPosData = [];
	_curWpData = [];

	_opMod = [] call SMGR_fnc_NavControllerGetOpMod;
	_errorRate = [] call SMGR_fnc_NavControllerGetErrorRate;
	_grid = [([] call SMGR_fnc_NavControllerGetGrid)] call SMGR_fnc_FormatGrid;
	_steering = [([] call SMGR_fnc_NavControllerGetSteering)] call SMGR_fnc_FormatAngle;
	_elevation = [([] call SMGR_fnc_NavControllerGetElevation)] call SMGR_fnc_FormatElevation;
	_powerLeft = [] call SMGR_fnc_NavControllerGetPowerLeft;
	_date = [date] call SMGR_fnc_FormatDate;
	_curPosData = [_opMod , _errorRate , _grid , _steering , _elevation , _powerLeft , _date ];

	if (count (NAMESPACE getVariable "smgrWpList") > 0) then {
		_curWp = [] call SMGR_fnc_NavControllerGetCurWp;
		_wpIdx = [_curWp] call SMGR_fnc_NavControllerGetWpIdx;
		_wpName = [_curWp] call SMGR_fnc_NavControllerGetWpName;
		_wpGrid = [[_curWp] call SMGR_fnc_NavControllerGetWpGrid] call SMGR_fnc_FormatGrid;
		_wpDir = [[_curWp] call SMGR_fnc_NavControllerGetWpDir] call SMGR_fnc_FormatAngle;
		_wpDist = [[_curWp] call SMGR_fnc_NavControllerGetWpDist] call SMGR_fnc_FormatDist;

		_curWpData = [ _wpIdx , _wpName , _wpGrid , _wpDir , _wpDist ];
	};

	// update nav view
	[ _curPosData, _curWpData ] call SMGR_fnc_NavControllerUpdateView;

	sleep 4;
};