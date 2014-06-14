#include "controls.h"
disableSerialization;

_removeIdx = _this select 0;
_wpList = missionNamespace getVariable ["smgrWpList",[]];
_dlg = findDisplay DLG_SMGR_IDD;

_wpList = [_wpList,[],{_x select 1},"ASCEND"] call BIS_fnc_sortBy;
_wpList = [_wpList, _removeIdx] call BIS_fnc_removeIndex;
{ _x set [1, _foreachIndex]; } forEach _wpList;

missionNamespace setVariable ["smgrWpList",_wpList];
[_dlg, DLG_SMGR_ScreenWplist_IDC] call SMGR_fnc_ShowScreen;