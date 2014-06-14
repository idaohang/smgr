#include "controls.hpp"

_controllerName = _this select 0;
_view = [_controllerName] call SMGR_fnc_MgmtGetView;

disableSerialization;
_dlg = findDisplay DLG_SMGR_IDD;
(_dlg displayCtrl _view) ctrlShow true;

player globalChat format ["Activating %1 view : %2", _controllerName, _view];