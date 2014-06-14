#include "controls.h"
disableSerialization;

_dlg = _this select 0;
_ctrlToBeShownIdc = _this select 1;

(_dlg displayCtrl DLG_SMGR_InputBuffer_IDC) ctrlSetText "";

_activeCtrlIdc = missionNamespace getVariable ["smgrActiveScreenIdc",0];
if (_activeCtrlIdc != 0) then
{
	(_dlg displayCtrl _activeCtrlIdc) ctrlShow false;
};

(_dlg displayCtrl _ctrlToBeShownIdc) ctrlShow true;

missionNamespace setVariable ["smgrActiveScreenIdc",_ctrlToBeShownIdc];
[_dlg,_ctrlToBeShownIdc] call SMGR_fnc_LoadScreenContext;