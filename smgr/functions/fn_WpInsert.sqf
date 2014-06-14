/*
    File: fn_WpInsert.sqf
    Author: <G.I.D> Sacha

    Description:
    Inserts a waypoint in the wp list.

    Parameters:
    0: Waypoint to insert (array)

    Returns:
    nothing
*/

#include "constants.hpp"

_wp = _this select 0;

_wpIdx = _wp select 1;
_wpList = NAMESPACE getVariable ["smgrWpList",[]];
_insertIdx = 0;

{
	if ((_x select 1) == (_wpIdx - 1)) then {
		_insertIdx = _foreachIndex + 1;
	};
} forEach _wpList;

_wpList = [_wpList, [_wp], _insertIdx] call BIS_fnc_arrayInsert;

NAMESPACE setVariable ["smgrWpList",_wpList];