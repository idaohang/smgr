#include "constants.hpp"
private [
    "_unit",
    "_dist",
    "_unitsSettings"
];

_dist = _this select 0;
_unitsSettings = NAMESPACE getVariable ["smgrSettingsUnitsElev",["Meter","Feet"]];
_unit = _unitsSettings select 0;

switch _unit do
{
    case "Meter":
    {
	    _dist = format ["ELE %1m MSL", round(_dist)];
    };
    case "Feet":
    {
	    _dist = round(_dist * 3.2808399);
	    _dist  = format ["ELE %1ft MSL", _dist];
    };

    default {};
};

_dist ;