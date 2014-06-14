
#include "controls.hpp"
disableSerialization;

_wpListItems = _this select 0;

_dlg = findDisplay DLG_SMGR_IDD;

_ctrlMenuListIdc = DLG_SMGR_ScreenWplist_List_IDC;
_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;
lbClear _ctrlMenuListIdc;

{
    _strWpIndex = _x select 0;
    _wpData = _x select 1;
    _idx =_ctrlMenuList lbAdd format["%1 - %2", _strWpIndex, _wpData];
    _ctrlMenuList lbSetValue [_idx, _wpIndex];
} forEach _wpListItems;

lbSortByValue _ctrlMenuList;
_ctrlMenuList lbadd "NEW";