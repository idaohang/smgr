#include "controls.h"
disableSerialization;

_wp = _this select 0;
_wpDist = _this select 1;
_wpAz = _this select 2;

_wpName = _wp select 0;
_wpIndex = _wp select 1;
_wpPos = _wp select 2;

_dlg = findDisplay DLG_SMGR_IDD;
[_dlg, DLG_SMGR_ScreenWpEdit_IDC] call SMGR_fnc_ShowScreen;


_editSetting = format ["[%1,(lbData [%2, (lbCurSel %2)])] call SMGR_fnc_EditWpSetting;", _this, DLG_SMGR_ScreenWpEdit_List_IDC];
_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
_keySel ctrlSetEventHandler ["ButtonClick",_editSetting];

_ctrl = _dlg displayCtrl DLG_SMGR_ScreenWpEdit_Title_IDC;
_ctrl ctrlSetText format ["EDIT WP %1", _wpIndex];

lbClear DLG_SMGR_ScreenWpEdit_List_IDC;
_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenWpEdit_List_IDC;

_idx = _ctrlMenuList lbAdd format ["NAME %1", _wpName];
_ctrlMenuList lbSetData [_idx, "name"];

_strWpPos = "";
if (count _wpPos == 0) then {
	_strWpPos = "n/a";
}else{
	_strWpPos = [_wpPos] call SMGR_fnc_FormatPos;
};
_idx = _ctrlMenuList lbAdd format ["POS %1", _strWpPos];
_ctrlMenuList lbSetData [_idx, "pos"];

_strWpDist = [_WpDist,false] call	SMGR_fnc_FormatDist;
_idx = _ctrlMenuList lbAdd format ["DIST %1", _strWpDist];
_ctrlMenuList lbSetData [_idx, "dist"];

_idx = _ctrlMenuList lbAdd format ["AZIMUTH %1 °", _wpAz];
_ctrlMenuList lbSetData [_idx, "az"];

_ctrlMenuList lbAdd "";

_idx = _ctrlMenuList lbAdd format ["SAVE", _wpAz];
_ctrlMenuList lbSetData [_idx, "save"];

If ((lbCurSel _ctrlMenuList)<0) then {_ctrlMenuList lbSetCurSel 0;};