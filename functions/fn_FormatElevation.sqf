_dist = _this select 0;
_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsElev",["Meter","Feet"]];
_eSource = (missionNamespace getVariable ["smgrSettingsAltimeter",["SAT","BAR"]]) select 0;
_unit = _unitsSettings select 0;

_eLabel = "";
switch (_eSource) do
{
    case "SAT":
    {
       _eLabel = "ELE";
    };
    case "BAR":
    {
       _eLabel = "ELb";
    };

    default {};
};

switch _unit do
{
    case "Meter":
    {
	    _dist = format ["%2 %1m MSL", round(_dist), _eLabel];
    };
    case "Feet":
    {
	    _dist = round(_dist * 3.2808399);
	    _dist  = format ["%2 %1ft MSL", _dist, _eLabel];
    };

    default {};
};

_dist;