/*
    File: fn_ControllerNavGetCurWp.sqf
    Author: <G.I.D> Sacha

    Description:
    Gets the currently selected waypoint

    Parameters:
    none

    Returns:
    Currently selected waypoint (array)
*/

#include "constants.hpp"

_waypoints = NAMESPACE getVariable ["smgrWpList",[]];
_wp = _waypoints select 0;

_wp;