/*
    File: fn_ControllerDataLink.sqf
    Author: <G.I.D> Sacha

    Description:
    Controls the DataLink menu

    Parameters:
    non

    Returns:
    nothing
*/

#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"

#define NO_DEVICE 0

// activate controller and view
["DataLinkController"] call SMGR_fnc_MgmtAssignKeyActions;
["DataLinkController"] call SMGR_fnc_MgmtActivateController;
["DataLinkController"] call SMGR_fnc_MgmtActivateView;

while {IsActiveController("DataLinkController")} do {

    _devices = NAMESPACE getVariable ["smgrConnectedDevices",[NO_DEVICE, NO_DEVICE]];
    _connectedDeviceLabel = {
        _str = switch (_this) do {
            case NO_DEVICE: {"Disconnected";};
            default{};
        };
        _str;
    };
    _labelCom1 = (_devices select 0) call _connectedDeviceLabel;
    _labelCom2 = (_devices select 1) call _connectedDeviceLabel;

    // update view
    [_labelCom1, _labelCom2] call SMGR_fnc_DataLinkControllerUpdateView;

};

["DataLinkController"] call SMGR_fnc_MgmtDeactivateView;