/*
    File: fn_FormatAngle.sqf
    Author: <G.I.D> Sacha

    Description:
    Returns an angle string, depending on chosen units in settings

    Parameters:
    0: Angle value in degrees, between 0 and 359 (number)

    Returns:
    String : Formated angle value.
*/

#include "constants.hpp"

_angle = _this select 0;
_unitsSettings = NAMESPACE getVariable ["smgrSettingsUnitsAngle",["Degrees","Mils"]];
_unit = _unitsSettings select 0;

_formatedAngle = "---";

if (_angle > 0) Then {
    switch _unit do
    {
        case "Degrees":
        {
    		_angleD = floor _angle;
    		_angleM = round ((_angle - (floor _angle))*60);
    	    _formatedAngle = format ["%1°%2'", _angleD, _angleM]
        };
        case "Mils":
        {
    	    _angle = floor(_angle * 17.777777778);
    	    _formatedAngle = format ["%1 Mil-µ", _angle];
        };

        default {};
    };
};

_formatedAngle;