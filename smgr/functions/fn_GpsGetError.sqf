/*
    File: GpsPull.sqf
    Author: <G.I.D> Sacha

    Description:
    Calculate GPS deviation in meters, based on environmental conditions.

    Parameters:
    0: Position (array)

    Returns:
    Number: Error in meters
*/

#include "constants.hpp"

_pos = _this select 0;

_elev = _pos select 2;
_error = 0;

switch true do
{
    case ((_elev < -3)and(_elev > -7)):
    {
    	 _error = -10 + random(20);
         NAMESPACE setVariable ["smgrPositionError",10];
    };
    case ((_elev < -7)and(_elev > -15)):
    {
    	 _error = -25 + random(50);
         NAMESPACE setVariable ["smgrPositionError",25];
    };
    case (_elev < -15):
    {
    	 _error = -100 + random(200);
         NAMESPACE setVariable ["smgrPositionError",100];
    };
    default { };
};

_error;