#include "controls.hpp"
#include "constants.hpp"

disableSerialization;

_dlg = findDisplay DLG_SMGR_IDD;

//hide all screens
[_dlg] call SMGR_fnc_MgmtHideAllScreens;
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

NAMESPACE setVariable ["smgrPowerProgress",0];

//disable hud
("SmgrRscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
NAMESPACE setVariable["smgrHudOn",false];

//reassign power ON to key 1
_key1 = _dlg displayCtrl DLG_SMGR_Key1_IDC;
_powerON = format ["[%1] call SMGR_fnc_MgmtActivateController;", ControllerBoot];
_key1 ctrlSetEventHandler ["ButtonClick",_powerON];
NAMESPACE setVariable ["smgrPower",false];