/*
    File: fn_mapGridPosition.sqf
    Author: <G.I.D> Sacha

    Description:
    Returns a map grid string, depending on map grid orientation

    Parameters:
    0: Position (array)

    Returns:
    String : 5 digit map grid "XXXXXYYYYY"
*/

#include "constants.hpp"

_pos = _this select 0;
if(typename _pos == "OBJECT") then {_pos = getpos _pos};

_mapFormat = NAMESPACE getVariable "smgrMapFormat";
_xOffset = NAMESPACE getVariable "smgrMapXOffset";
_yOffset = NAMESPACE getVariable "smgrMapYOffset";
_yInverted = NAMESPACE getVariable "smgrMapYInverted";

_eastings = 0;
_northings = 0;

if (!_yInverted) then {
    _eastings = round(_pos select 0) + _xOffset;
    _northings = round(_pos select 1) + _yOffset;
} else {
    _eastings = round(_pos select 0) + _xOffset;
    _northings = _yOffset - round(_pos select 1);
};

player globalChat str _yOffset;
player globalChat str round(_pos select 1);

switch true do
{
    case (_eastings < 10): {_eastings = format ["0000%1", _eastings];};
    case ((_eastings >= 10)and(_eastings < 100)): {_eastings = format ["000%1", _eastings];};
    case ((_eastings >= 100)and(_eastings < 1000)): {_eastings = format ["00%1", _eastings];};
    case ((_eastings >= 1000)and(_eastings < 10000)): {_eastings = format ["0%1", _eastings];};
    default {};
};


switch true do
{
    case (_northings < 10): {_northings = format ["0000%1", _northings];};
    case ((_northings >= 10)and(_northings < 100)): {_northings = format ["000%1", _northings];};
    case ((_northings >= 100)and(_northings < 1000)): {_northings = format ["00%1", _northings];};
    case ((_northings >= 1000)and(_northings < 10000)): {_northings = format ["0%1", _northings];};
    default {};
};

_grid = format ["%1%2", _eastings, _northings ];
_grid