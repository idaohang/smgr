#include "controls.h"
disableSerialization;

_linkPort = _this select 0;
_linkDevice = _this select 1;


switch (_linkDevice) do
{
	case DLG_SMGR_ScreenDataCom_P2P_IDC:
	{
    	[(findDisplay DLG_SMGR_IDD), DLG_SMGR_ScreenDataCom_P2P_IDC] call SMGR_fnc_ShowScreen;
	};

    case DLG_SMGR_ScreenDataCom_Glasses_IDC:
    {
    	("SmgrRscLayer" call BIS_fnc_rscLayer) cutRsc ["DlgSmgrHud", "PLAIN", 3, true];
    	[(findDisplay DLG_SMGR_IDD), DLG_SMGR_ScreenDataCom_Glasses_IDC] call SMGR_fnc_ShowScreen;

        _devices = missionNamespace getVariable ["smgrConnectedDevices",[0,0]];
        _devices set [_linkport,_linkDevice];
        missionNamespace setVariable ["smgrConnectedDevices", _devices];
    };

    default
    {
     	/* STATEMENT */
    };
};