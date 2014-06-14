#include "controls.h"
disableSerialization;

_action = _this select 0;

switch _action do
{
    case "disconnect":
    {
    	_devices = missionNamespace getVariable ["smgrConnectedDevices", [0,0]];
    	_idx = _devices find DLG_SMGR_ScreenDataCom_Glasses_IDC;
    	_devices set [_idx, 0];
    	missionNamespace setVariable ["smgrConnectedDevices",_devices];

    	("SmgrRscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
    	[(findDisplay DLG_SMGR_IDD), DLG_SMGR_ScreenData_IDC] call SMGR_fnc_ShowScreen;
    };

    default
    {
     	/* STATEMENT */
    };
};