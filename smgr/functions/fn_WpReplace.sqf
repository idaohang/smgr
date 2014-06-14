/*
    File: fn_WpReplace.sqf
    Author: <G.I.D> Sacha

    Description:
    Replaces a waypoint in the wp list.

    Parameters:
    0: Waypoint to set (array)

    Returns:
    nothing
*/
#include "constants.hpp"

_wp = _this select 0;

_wpIdx = _wp select 1;
_wpList = NAMESPACE getVariable ["smgrWpList",[]];

_replaceIdx = 0;
{
	if ((_x select 1) == (_wpIdx)) then {
		_replaceIdx = _foreachIndex;
	};
} forEach _wpList;

_wpList set [_replaceIdx, _wp];

NAMESPACE setVariable ["smgrWpList",_wpList];