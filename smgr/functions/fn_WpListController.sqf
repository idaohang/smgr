/*
    File: fn_ControllerWpList.sqf
    Author: <G.I.D> Sacha

    Description:
    Updates the wp list view.
    Gets the waypoints list and creates a a new list, to be displayed by the Wp list view

    Parameters:
    none

    Returns:
    nothing
*/

#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"

// activate controller and view
["WpListController"] call SMGR_fnc_MgmtAssignKeyActions;
["WpListController"] call SMGR_fnc_MgmtActivateController;
["WpListController"] call SMGR_fnc_MgmtActivateView;

// while wp list is the active view
while {IsActiveController("WpListController")} do {
    _wplist = NAMESPACE getVariable ["smgrWpList", []];
	_viewWpListItems = [];

	{
		_wpName = _x select 0;
		_wpIndex = _x select 1;
		_wpPos = _x select 2;

		_wpData = "";
		if (_wpName == "") then {
			_wpData = [_wpPos] call SMGR_fnc_FormatPos;
		}else{
			_wpData =_wpName;
		};

		_strWpIndex = "";
		switch true do {
		    case (_wpIndex < 10): { _strWpIndex = format ["00%1", _wpIndex]; };
		    case ((_wpIndex >= 10)and(_wpIndex < 100)): { _strWpIndex = format ["0%1", _wpIndex]; };
		    case ((_wpIndex >= 100)and(_wpIndex < 1000)): { _strWpIndex = format ["0%1", _wpIndex]; };
		    default{};
		};

	    _viewWpListItems set [_foreachIndex, [_strWpIndex,_wpData] ];
	} foreach _wplist;

	// update wp list view
	[_viewWpListItems] call SMGR_fnc_WpListControllerUpdateView;

	sleep 0.5;
};

["WpListController"] call SMGR_fnc_MgmtDeactivateView;