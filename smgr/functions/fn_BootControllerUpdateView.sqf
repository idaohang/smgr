#include "controls.hpp"
disableSerialization;

_progress = _this select 0;
_progressText = _this select 1;

_dlg = findDisplay DLG_SMGR_IDD;
_progressBar = _dlg displayCtrl DLG_SMGR_ScreenPowerOn_PowerProgressBar_IDC;
_progressLabel = _dlg displayCtrl DLG_SMGR_ScreenPowerOn_LoadingText_IDC;

_progressLabel ctrlSetText _progressText;
_progressBar progressSetPosition _progress;