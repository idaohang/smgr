#include "controls.h"
disableSerialization;

_offset = _this select 0;
_set = _this select 1;
_curSel = _this select 2;
_dlg = findDisplay DLG_SMGR_IDD;

_settings = missionNamespace getVariable _set;

switch _offset do
{
    case "next": { _settings = [_settings,"left"] call SMGR_fnc_arrayRotate; };
    case "prev": { _settings = [_settings,"right"] call SMGR_fnc_arrayRotate; };
    default {};
};

missionNamespace setVariable [_set,_settings];
[_dlg, DLG_SMGR_ScreenSettings_IDC] call SMGR_fnc_ShowScreen;
(_dlg displayCtrl DLG_SMGR_ScreenSettings_List_IDC) lbSetCurSel _curSel;