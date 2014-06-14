/*
    File: fn_ViewNav.sqf
    Author: <G.I.D> Sacha

    Description:
    Displays the Nav screen

    Parameters:
    0: Current position nav data (array)
        0: Operating mode (string)
        1: Error rate (string)
        2: Grid (string)
        3: Steering (string)
        4: Altitude (string)
        5: Powerleft (string)
        6: Date (string)
    1: Current waypoint nav data (empty if no waypoints) (array)
        0: Waypoint Index (string)
        1: Waypoint name (string)
        2: Waypoint grid (string)
        3: Waypoint direction (string)
        4: Waypoint distance (string)

    Returns:
    nothing
*/

#include "controls.hpp"
disableSerialization;

_navData = _this select 0;
_wpNavData = _this select 1;
_dlg = findDisplay DLG_SMGR_IDD;

// current pos nav data
(_dlg displayCtrl DLG_SMGR_ScreenNav_Status_IDC) ctrlSetText format ["%1", _navData select 0];
(_dlg displayCtrl DLG_SMGR_ScreenNav_Error_IDC) ctrlSetText format ["%1", _navData select 1];
(_dlg displayCtrl DLG_SMGR_ScreenNav_MainText_IDC) ctrlSetText format ["%1", _navData select 2];
(_dlg displayCtrl DLG_SMGR_ScreenNav_MyBearing_IDC) ctrlSetText (format ["STR %1", _navData select 3]);
(_dlg displayCtrl DLG_SMGR_ScreenNav_MyAltitude_IDC) ctrlSetText (format ["%1", _navData select 4]);
(_dlg displayCtrl DLG_SMGR_ScreenNav_Batt_IDC) ctrlSetText format ["%1",_navData select 5];
(_dlg displayCtrl DLG_SMGR_ScreenNav_Time_IDC) ctrlSetText format ["%1",_navData select 6];

//current waypoint nav data
if (count _wpNavData > 0) then {
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpNum_IDC) ctrlSetText format ["WP%1 %2", _wpNavData select 0, _wpNavData select 1];
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpGrid_IDC) ctrlSetText format ["POS %1", _wpNavData select 2];
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpRoute_IDC) ctrlSetText format ["DIR %1", _wpNavData select 3];
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpDistance_IDC) ctrlSetText format ["DIST %1",_wpNavData select 4];
} else {
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpNum_IDC) ctrlSetText "";
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpGrid_IDC) ctrlSetText "";
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpRoute_IDC) ctrlSetText "";
	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpDistance_IDC) ctrlSetText "";
};