#include "controls.h"
disableSerialization;

_dlg = _this select 0;

//hide all screens
[_dlg] call SMGR_fnc_HideAllScreens;
	//remove EHs before reassingning (except numlock)
{
	(_dlg displayCtrl _x) ctrlRemoveAllEventHandlers "ButtonClick";
} forEach [
	DLG_SMGR_Key0_IDC,
	DLG_SMGR_Key1_IDC,
	DLG_SMGR_Key2_IDC,
	DLG_SMGR_Key3_IDC,
	DLG_SMGR_Key4_IDC,
	DLG_SMGR_Key5_IDC,
	DLG_SMGR_Key6_IDC,
	DLG_SMGR_Key7_IDC,
	DLG_SMGR_Key8_IDC,
	DLG_SMGR_Key9_IDC,
	DLG_SMGR_KeySEL_IDC
];

missionNamespace setVariable ["smgrPowerProgress",0];

//disable hud
("SmgrRscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
missionNamespace setVariable["smgrHudOn",false];

//reassign power ON to key 1
_key1 = _dlg displayCtrl DLG_SMGR_Key1_IDC;
_powerON = format ["[(findDisplay %1),%2] call SMGR_fnc_ShowScreen;", DLG_SMGR_IDD,DLG_SMGR_ScreenPowerOn_IDC];
_key1 ctrlSetEventHandler ["ButtonClick",_powerON];
missionNamespace setVariable ["smgrPower",false];