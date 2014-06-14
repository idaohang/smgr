#include "controls.hpp"
disableSerialization;

_controllerName = _this select 0;
_dlg = [_this, 1, (findDisplay DLG_SMGR_IDD), [(findDisplay 0)]] call bis_fnc_param;

_view = [_controllerName] call SMGR_fnc_MgmtGetView;

(_dlg displayCtrl _view) ctrlShow false;