#include "controls.hpp"
disableSerialization;

_progress = _this select 0;
_progressText = _this select 1;

_dlg = findDisplay DLG_SMGR_IDD;
_progressBar = _dlg displayCtrl DLG_SMGR_ScreenDataCom_P2PPorgressBar_IDC;
_progressLabel = _dlg displayCtrl DLG_SMGR_ScreenDataCom_P2PPorgressText_IDC;

_progressBar progressSetPosition _progress;
_progressLabel ctrlSetText _progressText;