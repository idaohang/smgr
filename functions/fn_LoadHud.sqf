#include "controls.h"
disableSerialization;

_ctrl = _this displayCtrl DLG_SMGR_Smgr_IDC;

_pos  = ctrlPosition _ctrl;

_ctrl ctrlSetPosition [
	(0.29375 * 2.8 *safezoneW + safezoneX),
	(0.225 * 3.1 * safezoneH + safezoneY)
];
_ctrl ctrlCommit 0;

_this call SMGR_fnc_Load;