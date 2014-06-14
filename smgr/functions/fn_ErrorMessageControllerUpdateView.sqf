#include "controls.hpp"
disableSerialization;

_message = _this select 0;

_dlg = _this select 0;
_message = _this select 1;

(_dlg displayCtrl DLG_SMGR_ScreenErrorMessage_Text_IDC) ctrlSetText _message;