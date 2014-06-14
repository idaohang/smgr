/*
    File: fn_mapSettings.sqf
    Author: <G.I.D> Sacha

    Description:
    Calculate and set grid basic variables : Grid format, Y offset, X ffset, is Y inverted.

    Parameters:
    none

    Returns:
    nothing
*/

#include "constants.hpp"

_gridOrigin = mapGridPosition [0,0];
_xOrigin = [_gridOrigin,0,2] call BIS_fnc_trimString;
_yOrigin = [_gridOrigin,3,5] call BIS_fnc_trimString;

//is Y inverted ?
_gridStepY = mapGridPosition [0,100];
_yStep = [_gridStepY,3,5] call BIS_fnc_trimString;
_yInverted = false;
if ((parseNumber _yOrigin) > (parseNumber _yStep)) then {
	_yInverted = true;
};

//find map origin (bottom left) coords
_i = 1; _j = 1;
while {mapGridPosition [0,-_i] == _gridOrigin} do { _i = _i + 1; };
if _yInverted then { _i = 0 - _i; };
_yOffset = (parseNumber _yOrigin) * 100 + _i;

while {mapGridPosition [-_j,0] == _gridOrigin} do { _j = _j + 1; };
_xOffset = (parseNumber _xOrigin) * 100 + _j; //Assume X is never inverted

//set vars
NAMESPACE setVariable ["smgrMapFormat","MGRS"];
NAMESPACE setVariable ["smgrMapXOffset",_xOffset];
NAMESPACE setVariable ["smgrMapYOffset",_yOffset];
NAMESPACE setVariable ["smgrMapYInverted",_yInverted];