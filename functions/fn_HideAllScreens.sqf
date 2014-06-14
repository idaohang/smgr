#include "controls.h"
disableSerialization;

_dlg = _this select 0;
{ (_dlg displayCtrl _x) ctrlShow false; } forEach [
	DLG_SMGR_ScreenPowerOn_IDC,
	DLG_SMGR_ScreenMainMenu_IDC,
	DLG_SMGR_ScreenNav_IDC,
	DLG_SMGR_ScreenWplist_IDC,
	DLG_SMGR_ScreenSettings_IDC,
	DLG_SMGR_ScreenWpEdit_IDC,
	DLG_SMGR_ScreenData_IDC,
	DLG_SMGR_ScreenDataCom_IDC,
	DLG_SMGR_ScreenDataCom_Glasses_IDC,
	DLG_SMGR_ScreenErrorMessage_IDC,
	DLG_SMGR_ScreenDataCom_P2P_IDC
];