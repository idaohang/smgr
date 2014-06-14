/*
    File: fn_UnassignKeyActions.sqf
    Author: <G.I.D> Sacha

    Description:
    Unassigns all actions from device input interface

    Parameters:
    none

    Returns:
    nothing
*/
#include "controls.hpp"

disableSerialization;
_dlg = [_this, 0, (findDisplay DLG_SMGR_IDD), [(findDisplay 0)]] call bis_fnc_param;

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
	DLG_SMGR_KeySEL_IDC,
	DLG_SMGR_KeyINP_IDC
];