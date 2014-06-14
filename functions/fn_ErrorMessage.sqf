#include "controls.h"
disableSerialization;

_this spawn {
	disableSerialization;
	_dlg = _this select 0;
	_message = _this select 1;

	(_dlg displayCtrl DLG_SMGR_ScreenErrorMessage_Text_IDC) ctrlSetText _message;
	(_dlg displayCtrl DLG_SMGR_ScreenErrorMessage_IDC) ctrlShow true;
	sleep 3;
	(_dlg displayCtrl DLG_SMGR_ScreenErrorMessage_IDC) ctrlShow false;
	(_dlg displayCtrl DLG_SMGR_ScreenErrorMessage_Text_IDC) ctrlSetText "";
};