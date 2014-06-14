#include "controls.h"
disableSerialization;

_port = _this select 0;

_dlg = findDisplay DLG_SMGR_IDD;
_devices = missionNamespace getVariable ["smgrConnectedDevices",[0,0]];

switch (_devices select _port) do
{
    case 0:
    {
    	[_dlg,DLG_SMGR_ScreenDataCom_IDC] call SMGR_fnc_ShowScreen;
    	_ctrlTitle = _dlg displayCtrl DLG_SMGR_ScreenDataCom_Title_IDC;
    	_ctrlTitle ctrlSetText format ["COM%1", _port+1];


    	_ctrlMenuListIdc = DLG_SMGR_ScreenDataCom_List_IDC;
    	lbClear _ctrlMenuListIdc;
    	_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;

    	/*if ((goggles player == "G_Tactical_Black")or(goggles player == "G_Tactical_Clear")) then {
    		if !(DLG_SMGR_ScreenDataCom_Glasses_IDC in _devices) then {
	    		_idx = _ctrlMenuList lbAdd "Tac. Glasses";
	    		_ctrlMenuList lbSetValue [_idx, DLG_SMGR_ScreenDataCom_Glasses_IDC];
    		};
    	};*/

		_nearMan = nearestObjects [player, ["Man"], 3];
		if (count _nearMan > 1) then {
	    		_xferPear = _nearMan select 1;
	    		missionNamespace setVariable ["smgrXferPear",_xferPear];
	    		_idx = _ctrlMenuList lbAdd format ["P2P %1", name _xferPear];
	    		_ctrlMenuList lbSetValue [_idx, DLG_SMGR_ScreenDataCom_P2P_IDC];
		};

    	_ctrlMenuList lbSetCurSel 0;

    };

    case DLG_SMGR_ScreenDataCom_Glasses_IDC:
    {
    	[_dlg, DLG_SMGR_ScreenDataCom_Glasses_IDC] call SMGR_fnc_ShowScreen;
	};

    default {};
};