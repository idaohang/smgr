#include "controls.hpp";

_message = _this select 0;

["ErrorMessageController"] call SMGR_fnc_MgmtActivateView;

[_message] call SMGR_fnc_ErrorMessageControllerUpdateView;
sleep 3;

["ErrorMessageController"] call SMGR_fnc_MgmtDectivateView;