#include "controls.h"
disableSerialization;

_str = _this select 0;
_dlg = findDisplay DLG_SMGR_IDD;
_value = "";
if (_str == "clear") then {
	_value = "";
} else {
	_value = (missionNamespace getVariable ["smgrInputBuffer",""]) + _str;
};

missionNamespace setVariable ["smgrInputBuffer", _value];
_inputBufferCtrl = _dlg displayCtrl DLG_SMGR_InputBuffer_IDC;
_inputBufferCtrl ctrlSetText format ["[%1]", _value];