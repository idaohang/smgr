/*
    File: fn_ViewWpEdit.sqf
    Author: <G.I.D> Sacha

    Description:
    Displays the view for editing a waypoint

    Parameters:
    0: Waypoint to edit (array)
    1: Distance to waypoint (number)
    2: Azimuthe to waypoint (number)

    Returns:
    nothing
*/

#include "controls.hpp"
disableSerialization;

_wpIndex = _this select 0;
_wpName = _this select 1;
_strWpPos = _this select 2 ;
_strWpDist = _this select 3;
_wpAz = _this select 4;

_dlg = findDisplay DLG_SMGR_IDD;

_ctrl = _dlg displayCtrl DLG_SMGR_ScreenWpEdit_Title_IDC;
_ctrl ctrlSetText format ["EDIT WP %1", _wpIndex];

lbClear DLG_SMGR_ScreenWpEdit_List_IDC;
_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenWpEdit_List_IDC;

_idx = _ctrlMenuList lbAdd format ["NAME %1", _wpName];
_ctrlMenuList lbSetData [_idx, "name"];

_idx = _ctrlMenuList lbAdd format ["POS %1", _strWpPos];
_ctrlMenuList lbSetData [_idx, "pos"];

_idx = _ctrlMenuList lbAdd format ["DIST %1", _strWpDist];
_ctrlMenuList lbSetData [_idx, "dist"];

_idx = _ctrlMenuList lbAdd format ["AZIMUTH %1 °", _wpAz];
_ctrlMenuList lbSetData [_idx, "az"];

_idx = _ctrlMenuList lbAdd "SAVE";
_ctrlMenuList lbSetData [_idx, "save"];

If ((lbCurSel _ctrlMenuList)<0) then {_ctrlMenuList lbSetCurSel 0;};