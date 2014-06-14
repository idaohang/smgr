_dist = _this select 0;
_isALtitude = _this select 1;
_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsDist",["Metric","English","Nautical"]];
_unit = _unitsSettings select 0;

switch _unit do
{
    case "Metric":
    {
    	_dist = format ["%1m", round(_dist)];
    };
    case "English":
    {
    	_dist = round(_dist * 1.0936133);
    	if (_dist < 1760) then {
    		_dist = format ["%1yrd", _dist];
    	} else {
    		_dist = _dist / 1760;
    		_dist = (round(_dist * 100))/100;
    		_dist = format ["%1mi", _dist];
    	};
    };
    case "Nautical":
    {
    	_dist = _dist / 1849.1;
    	_dist = (round(_dist * 100))/100;
    	_dist = format ["%1 NM",_dist];

    };

    default {};
};

_dist;