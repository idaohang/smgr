#include "controls.hpp"
disableSerialization;

_labels = _this select 0;

_dlg = findDisplay DLG_SMGR_IDD;
_labelCom1 = _labels select 0;
_labelCom2 = _labels select 1;

lbClear DLG_SMGR_ScreenData_List_IDC;
_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenData_List_IDC;

_ctrlMenuList lbAdd format ["COM1 %1", _labelCom1];
_ctrlMenuList lbAdd format ["COM2 %1", _labelCom2];

_ctrlMenuList lbSetCurSel 0;