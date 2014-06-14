_pos = _this select 0;
_coordSettings = missionNamespace getVariable ["smgrSettingsCoordSystem",["MGRS-New","L/L dm"]];
_coordSystem = _coordSettings select 0;

_grid = [_pos] call SMGR_fnc_mapGridPosition;
_gridE = [_grid,0,4] call BIS_fnc_trimString;
_gridN = [_grid,5,9] call BIS_fnc_trimString;

switch _coordSystem do
{
    case "MGRS-New":
    {
    	_grid = format ["%1e %2n", _gridE, _gridN];
    };
    case "L/L dm":
    {
    	_gridEa = [_gridE,0,1] call BIS_fnc_trimString;
    	_gridEb = [_gridE,2,3] call BIS_fnc_trimString;
    	_gridNa = [_gridN,0,1] call BIS_fnc_trimString;
    	_gridNb = [_gridN,2,3] call BIS_fnc_trimString;

    	_grid = format ["%1°%2' %3°%4'", _gridEa, _gridEb, _gridNa, _gridNb];
    };

    default {};
};

_grid;