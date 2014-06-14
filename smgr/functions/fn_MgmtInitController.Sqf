#include "constants.hpp"

private [
	"_controllerName",
	"_initParams",
	"_controllerConfig",
	"_controllerInitFunction",
	"_type",
	"_initCode"
];

_controllerName = _this select 0;
_initParams = [_this, 1, [], [objNull,[]]] call bis_fnc_param;

_controllerConfig = CONFIG_FILE >> "CfgSmgr" >> "Controllers" >> _controllerName;
_controllerInitFunction = getText(_controllerConfig >> "initFunction");
_type = getText(_controllerConfig >> "type");

if (_type == "static") then {
	[] call SMGR_fnc_MgmtDeactivateAllViews;
	[_controllerName] call SMGR_fnc_MgmtAssignKeyActions;
	[_controllerName] call SMGR_fnc_MgmtActivateController;
};

[_controllerName] call SMGR_fnc_MgmtActivateView;

disableSerialization;
_initCode = compile _controllerInitFunction;
_initParams call _initCode;

player globalChat format ["Init %1 with %2", _controllerName, _controllerInitFunction];