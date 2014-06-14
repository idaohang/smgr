_angle = _this select 0;
_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsAngle",["Degrees","Mils"]];
_unit = _unitsSettings select 0;

switch _unit do
{
    case "Degrees":
    {
		_angleD = floor _angle;
		_angleM = round ((_angle - (floor _angle))*60);
	    _angle = format ["%1°%2'", _angleD, _angleM]
    };
    case "Mils":
    {
	    _angle = floor(_angle * 17.777777778);
	    _angle = format ["%1 Mil-µ", _angle];
    };

    default {};
};

_angle;