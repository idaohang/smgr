_gpsMem = missionNamespace getVariable ["smgrGpsMemory", [(getPosASL player),(getPosASL player)]];
_myPos = _gpsMem select 0;
_lastPos = _gpsMem select 1;

_myGrid = [_myPos] call SMGR_fnc_FormatPos;

_mySteering = [_lastPos, _myPos] call BIS_fnc_dirTo;
if (_mySteering < 0) then {_mySteering = 360 + _mySteering;};
_mySteering = [_mySteering] call SMGR_fnc_FormatAngle;
if ([_myPos,_lastPos] call BIS_fnc_arrayCompare) then { _mySteering = "---"; };

_myAltitude = [(_myPos select 2)] call SMGR_fnc_FormatElevation;

_mods = missionNamespace getVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];
_opMod = _mods select 0;

_msf = missionNamespace getVariable ["smgrMSF",0];
_strMsf = "";
_errorRate = "";

;

if (((missionNamespace getVariable "smgrSettingsOpMod") select 0) == "STBY") then {
	_msf = floor(_msf/60);
	if (_msf < 1) then {
		_strMsf = "<1min";
	} else {
		if (_msf>99) then {
			_strMsf = "OLD";
		} else {
			_strMsf = format ["%1min", _msf];
		};
	};

	if (missionNamespace getVariable ["smgrErrorStr","dist"] == "dist") then {
		_errorRate = _strMsf;
		missionNamespace setVariable ["smgrErrorStr","msf"];
	} else {
		_errorRate = format ["+%1m", missionNamespace getVariable ["smgrPositionError", 1]];
		missionNamespace setVariable ["smgrErrorStr","dist"];
	};
} else {
	_errorRate = format ["+%1m", missionNamespace getVariable ["smgrPositionError", 1]];
};

_powerLeft = missionNamespace getVariable ["smgrPowerLeft",7200];
_powerLeft = "Batt " + str(ceil(_powerLeft/72)) + "%";


_date = date;
_year = _date select 0;
_month =  switch (_date select 1) do
{
    case 1: { "Jan" };
    case 2: { "Feb" };
    case 3: { "Mar" };
    case 4: { "Apr" };
    case 5: { "May" };
    case 6: { "Jun" };
    case 7: { "Jul" };
    case 8: { "Aug" };
    case 9: { "Sep" };
    case 10: { "Oct" };
    case 11: { "Nov" };
    case 12: { "Dec" };
    default {};
};
_day = _date select 2;
_hours = _date select 3;
if (_hours < 10) then { _hours = "0" + (str _hours); };
_minutes = _date select 4;
if (_minutes < 10) then { _minutes = "0" + (str _minutes); };

_date = format ["%1 %2 %3 %4:%5", _year, _month, _day, _hours, _minutes];


_navData = [_opMod, _errorRate, _myGrid, _mySteering, _myAltitude, _powerLeft, _date];
_navData;