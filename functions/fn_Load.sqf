#include "controls.h"
disableSerialization;


//load settings or set to default
_coordSettings = missionNamespace getVariable ["smgrSettingsCoordSystem",["MGRS-New","L/L dm"]];
missionNamespace setVariable ["smgrSettingsCoordSystem",_coordSettings];

_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsDist",["Metric","English","Nautical"]];
missionNamespace setVariable ["smgrSettingsUnitsDist",_unitsSettings];

_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsElev",["Meter","Feet"]];
missionNamespace setVariable ["smgrSettingsUnitsElev",_unitsSettings];

_unitsSettings = missionNamespace getVariable ["smgrSettingsUnitsAngle",["Degrees","Mils"]];
missionNamespace setVariable ["smgrSettingsUnitsAngle",_unitsSettings];

_opMods = missionNamespace getVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];
missionNamespace setVariable ["smgrSettingsOpMod",_opMods];

missionNamespace setVariable ["smgrPositionError",1];


//get power state
_power = missionNamespace getVariable ["smgrPower",false];
//set the main menu as default screen
_activeScreenIdc = missionNamespace getVariable ["smgrActiveScreenIdc",DLG_SMGR_ScreenMainMenu_IDC];

//hide all screens
[_this] call SMGR_fnc_HideAllScreens;

if (_power) then {
	//show active Screen
	[_this, _activeScreenIdc] call SMGR_fnc_ShowScreen;
} else {
	//power
	[_this] call SMGR_fnc_RemoveAllEHButtonClick;
	_key1 = _this displayCtrl DLG_SMGR_Key1_IDC;
	_powerON = format ["[(findDisplay %1),%2] call SMGR_fnc_ShowScreen;", DLG_SMGR_IDD,DLG_SMGR_ScreenPowerOn_IDC];
	_key1 ctrlSetEventHandler ["ButtonClick",_powerON];
};