#include "controls.hpp"
disableSerialization;

_menuItems = _this select 0;

_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenSettings_List_IDC;
lbClear DLG_SMGR_ScreenSettings_List_IDC;

{
	_label = _x select 0;
	_data = _x select 1;
	_idx =_ctrlMenuList lbAdd _label;
	_ctrlMenuList lbSetData [_idx, _data];
} foreach _menuItems;

_ctrlMenuList lbSetCurSel 0;