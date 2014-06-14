/*
    File: fn_MgmtGetView.sqf
    Author: <G.I.D> Sacha

    Description:
    Gets the view id of the given controller

    Parameters:
    0: Controller name (string)

    Returns:
    Controllers view id (number)
*/

#include "constants.hpp"

_controllerName = _this select 0;

_controllerConfig = CONFIG_FILE >> "CfgSmgr" >> "Controllers" >> _controllerName;
_view = getNumber(_controllerConfig >> "view");

_view;