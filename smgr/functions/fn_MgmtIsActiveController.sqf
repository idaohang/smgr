/*
    File: fn_MgmtIsActiveController.sqf
    Author: <G.I.D> Sacha

    Description:
    Checks if a controller is currently the active controller

    Parameters:
    0: Controller name (string)

    Returns:
    Boolean : true if controller is active, false if it's not.
*/

#include "constants.hpp"

_controllerName = _this select 0;

_isActiveController = false;
if (NAMESPACE getVariable ["smgrActiveController",0] == _controllerName) then {
	_isActiveController = true;
};

_isActiveController;