/*
    File: fn_ControllerWpEditSelectField.sqf
    Author: <G.I.D> Sacha

    Description:
    Controls the action to take when given field of the WpEdit view is selected

    Parameters:
    0: Field name (string)

    Returns:
    nothing
*/

#include "controls.hpp"
#include "constants.hpp"

disableSerialization;

_field = _this select 0;
_dlg = findDisplay DLG_SMGR_IDD;

NAMESPACE setVariable ["smgrInputBuffer",""];
_updateFunction = format ["['%1'] call SMGR_fnc_ControllerWpEditUpdateField", _field];
_setInputActions = {
	_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
	_keySel ctrlSetEventHandler ["ButtonClick",_updateFunction];
};

switch _field do
{
    case "name":
    {
    	[ALPHA_CONTEXT] call SMGR_fnc_MgmtAssignKeyActions;
    	[] call _setInputActions;
    };
    case "pos":
    {
    	[NUMLOCK_CONTEXT] call SMGR_fnc_MgmtAssignKeyActions;
    	[] call _setInputActions;
    };
    case "dist":
    {
    	[NUMLOCK_CONTEXT] call SMGR_fnc_MgmtAssignKeyActions;
    	[] call _setInputActions;
    };
    case "az":
    {
    	[NUMLOCK_CONTEXT] call SMGR_fnc_MgmtAssignKeyActions;
    	[] call _setInputActions;
    };

    case "save":
    {
    	[] call SMGR_fnc_ControllerWpEditSave;
    };

    default {};
};