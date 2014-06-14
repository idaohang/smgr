#include "controls.hpp"
#include "constants.hpp"
private [
	 "_dlg"
	,"_power"
	,"_activeController"
	,"_key1"
	,"_key1"
];

disableSerialization;
_dlg = _this;

//get power state
_power = NAMESPACE getVariable ["smgrPower",false];
_activeController = NAMESPACE getVariable ["smgrActiveController","MainMenuController"];

[_dlg] call SMGR_fnc_MgmtDeactivateAllViews;

if (_power) then {
	[_activeController] call SMGR_fnc_MgmtInitController;
} else {
	[_dlg] call SMGR_fnc_MgmtUnassignAllKeyActions;

	disableSerialization;
	_key1 = _dlg displayCtrl DLG_SMGR_Key1_IDC;
	_key1 ctrlSetEventHandler ["ButtonClick","['BootController'] call SMGR_fnc_MgmtInitController;"];
};