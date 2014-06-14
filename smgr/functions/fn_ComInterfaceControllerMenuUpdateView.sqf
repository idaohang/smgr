#include "controls.hpp"
disableSerialization;

_title = _this select 0;
_menuItems = _this select 1;

_dlg = findDisplay DLG_SMGR_IDD;

_ctrlTitle = _dlg displayCtrl DLG_SMGR_ScreenDataCom_Title_IDC;
_ctrlTitle ctrlSetText _title;


lbClear DLG_SMGR_ScreenDataCom_List_IDC;
_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenDataCom_List_IDC;

{
	_label = _x select 0;
	_value = _x select 1;
	_idx = _ctrlMenuList lbAdd _label;
	_ctrlMenuList lbSetValue [_idx, _value];
} forEach _menuItems;