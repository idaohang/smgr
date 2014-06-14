#include "controls.hpp"
private [
	"_menuList",
	"_controllerName"
];

disableSerialization;

_menuList = (findDisplay DLG_SMGR_IDD) displayCtrl DLG_SMGR_ScreenMainMenu_List_IDC;
_controllerName = _menuList lbData (lbCurSel DLG_SMGR_ScreenMainMenu_List_IDC);

[_controllerName] call SMGR_fnc_MgmtInitController;