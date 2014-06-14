#include "controls.hpp"
disableSerialization;

_menuItems = _this select 0;

_ctrlMenuListIdc = DLG_SMGR_ScreenMainMenu_List_IDC;
_ctrlMenuList = (findDisplay DLG_SMGR_IDD) displayCtrl _ctrlMenuListIdc;
lbClear _ctrlMenuListIdc;

{
	_label = _x select 0;
	_value = _x select 1;
	_idx =_ctrlMenuList lbAdd _label;
	_ctrlMenuList lbSetData [_idx, _value];
} foreach _menuItems;

_ctrlMenuList lbSetCurSel 0;