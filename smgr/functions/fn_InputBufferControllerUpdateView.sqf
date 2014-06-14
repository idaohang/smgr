#include "controls.hpp"
disableSerialization;

_text = _this select 0;

_inputBufferCtrl = _dlg displayCtrl DLG_SMGR_InputBuffer_IDC;
_inputBufferCtrl ctrlSetText format ["[%1]", _text];