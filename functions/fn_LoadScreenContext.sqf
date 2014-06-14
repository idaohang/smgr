#include "controls.h"
disableSerialization;

_dlg = _this select 0;
_ctrlIdc = _this select 1;
[_dlg,_ctrlIdc] call SMGR_fnc_MapKeys;

switch _ctrlIdc do
{
	//Power ON Screen
	case DLG_SMGR_ScreenPowerOn_IDC:
	{
		missionNamespace setVariable ["smgrPower",true];
		//reset op mpd settings ti quick fix
		missionNamespace setVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];

		//if we haven't started the power-on sequence counter yet, do it now
		if (missionNamespace getVariable ["smgrPowerProgress",0] == 0) then {
			[] spawn {
				_progress = 0;

				while {_progress <= 1.5} do {
					_progress = _progress +0.02;
					missionNamespace setVariable ["smgrPowerProgress",_progress];
					sleep 0.1;
				};
			};
		};

		//refresh power-on screen until power-on sequence counter reachs 1
		[_dlg] spawn {
			disableSerialization;
			_dlg = _this select 0;
			_progressBar = _dlg displayCtrl DLG_SMGR_ScreenPowerOn_PowerProgressBar_IDC;
			_progressText = _dlg displayCtrl DLG_SMGR_ScreenPowerOn_LoadingText_IDC;

			while {(missionNamespace getVariable ["smgrPowerProgress",0] <= 1) and (!isNull _dlg)} do {
				switch true do
				{
				    case (missionNamespace getVariable ["smgrPowerProgress",0] < 0.7):
				    {
				    	_progressText ctrlSetText "Self Test...";
				    };

				    default
				    {
				    	_progressText ctrlSetText "First Fix...";
				    };
				};
				_progressBar progressSetPosition (missionNamespace getVariable ["smgrPowerProgress",0]);

				sleep 0.1;
			};

		};

		[_dlg] spawn {
			disableSerialization;
			_dlg = _this select 0;

			waitUntil {missionNamespace getVariable ["smgrPowerProgress",0] >= 1};
			//start gps tracking
			[_dlg, 2] spawn {
				disableSerialization;
				_dlg = _this select 0;
				_refreshRate = _this select 1;
				[_dlg, _refreshRate] call SMGR_fnc_TrackPos;
			};
			//show first screen after power-on sequence
			[_dlg] call SMGR_fnc_HideAllScreens;
			[_dlg, DLG_SMGR_ScreenMainMenu_IDC] call SMGR_fnc_ShowScreen;
		};

	};

	//Main Menu screnn
    case DLG_SMGR_ScreenMainMenu_IDC:
    {
    	//Load menu entry list
    	_ctrlMenuListIdc = DLG_SMGR_ScreenMainMenu_List_IDC;
    	_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;
    	lbClear _ctrlMenuListIdc;

    	{
    		_label = _x select 0;
    		_value = _x select 1;
			_idx =_ctrlMenuList lbAdd _label;
			_ctrlMenuList lbSetValue [_idx, _value];
		} foreach [
			["NAV",DLG_SMGR_ScreenNav_IDC],
			["WP LIST",DLG_SMGR_ScreenWplist_IDC],
			["DATA LINK",DLG_SMGR_ScreenData_IDC],
			["SETTINGS",DLG_SMGR_ScreenSettings_IDC]
		];
		_ctrlMenuList lbSetCurSel 0;
    };

    //Nav screen
    case DLG_SMGR_ScreenNav_IDC:
    {
    	[_dlg] spawn {
    		disableSerialization;
    		_dlg = _this select 0;
    		_navCtrl = _dlg displayCtrl DLG_SMGR_ScreenNav_IDC;
    		while {ctrlShown _navCtrl} do {
		    	//present position
		    	_navData = [] call SMGR_fnc_GetNavData;
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_Status_IDC) ctrlSetText format ["%1", _navData select 0];
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_Error_IDC) ctrlSetText format ["%1", _navData select 1];
				(_dlg displayCtrl DLG_SMGR_ScreenNav_MainText_IDC) ctrlSetText format ["%1", _navData select 2];
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_MyBearing_IDC) ctrlSetText (format ["STR %1", _navData select 3]);
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_MyAltitude_IDC) ctrlSetText (format ["%1", _navData select 4]);
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_Batt_IDC) ctrlSetText format ["%1",_navData select 5];
			    (_dlg displayCtrl DLG_SMGR_ScreenNav_Time_IDC) ctrlSetText format ["%1",_navData select 6];

			    //current waypoint
			    _waypoints = missionNamespace getVariable ["smgrWpList",[]];
			    if ((count _waypoints) > 0) then {
			    	_wpNavData = [] call SMGR_fnc_GetWpNavData;
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpNum_IDC) ctrlSetText format ["WP%1 %2", _wpNavData select 0, _wpNavData select 1];
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpGrid_IDC) ctrlSetText format ["POS %1", _wpNavData select 2];
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpRoute_IDC) ctrlSetText format ["DIR %1", _wpNavData select 3];
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpDistance_IDC) ctrlSetText format ["DIST %1",_wpNavData select 4];
			    } else {
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpNum_IDC) ctrlSetText "";
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpGrid_IDC) ctrlSetText "";
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpRoute_IDC) ctrlSetText "";
			    	(_dlg displayCtrl DLG_SMGR_ScreenNav_WpDistance_IDC) ctrlSetText "";
				};

			    sleep 0.5;
		    };
	    };
	};

    //WpList Screen
    case DLG_SMGR_ScreenWplist_IDC:
    {
    	_wplist = missionNamespace getVariable ["smgrWpList", []];

    	_ctrlMenuListIdc = DLG_SMGR_ScreenWplist_List_IDC;
    	_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;
    	lbClear _ctrlMenuListIdc;
    	{
    		_wpName = _x select 0;
    		_wpIndex = _x select 1;
    		_wpPos = _x select 2;

  			_wpData = "";
    		if (_wpName == "") then {
    			_wpData = [_wpPos] call SMGR_fnc_FormatPos;
			}else{
				_wpData =_wpName;
			};

			_strWpIndex = "";
    		switch true do {
    		    case (_wpIndex < 10): { _strWpIndex = format ["00%1", _wpIndex]; };
    		    case ((_wpIndex >= 10)and(_wpIndex < 100)): { _strWpIndex = format ["0%1", _wpIndex]; };
    		    case ((_wpIndex >= 100)and(_wpIndex < 1000)): { _strWpIndex = format ["0%1", _wpIndex]; };
    		    default{};
    		};

			_idx =_ctrlMenuList lbAdd format["%1 - %2", _strWpIndex, _wpData];
			_ctrlMenuList lbSetValue [_idx, _wpIndex];

		} foreach _wplist;

		lbSortByValue _ctrlMenuList;
		_ctrlMenuList lbadd "NEW";
		_ctrlMenuList lbSetCurSel (count _wpList);
	};

	//Data link Screen
    case DLG_SMGR_ScreenData_IDC:
    {
    	_ctrlMenuListIdc = DLG_SMGR_ScreenData_List_IDC;
    	lbClear _ctrlMenuListIdc;
    	_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;

    	_devices = missionNamespace getVariable ["smgrConnectedDevices",[0,0]];

    	_connectedDeviceName = {
    		_str = switch (_this) do {
    		    case 0: {"D/C";};
    		    case DLG_SMGR_ScreenDataCom_Glasses_IDC: {"Tac. Glasses";};
    		    default{};
    		};
    		_str;
    	};

    	_labelCom1 = (_devices select 0) call _connectedDeviceName;
    	_labelCom2 = (_devices select 1) call _connectedDeviceName;
    	_ctrlMenuList lbAdd format ["COM1 %1", _labelCom1];
    	_ctrlMenuList lbAdd format ["COM2 %1", _labelCom2];

    	_ctrlMenuList lbSetCurSel 0;
    };
    //Tactival GLasses settings Screen
    case DLG_SMGR_ScreenDataCom_Glasses_IDC:
    {
    	_ctrlMenuList = _dlg displayCtrl DLG_SMGR_ScreenDataCom_Glasses_List_IDC;
    	lbCLear DLG_SMGR_ScreenDataCom_Glasses_List_IDC;

    	_idx = _ctrlMenuList lbAdd "Disconnect";
    	_ctrlMenuList lbsetData [_idx, "disconnect"];
    	_ctrlMenuList lbSetCurSel 0;
	};

	//Settins Screen
    case DLG_SMGR_ScreenSettings_IDC:
    {
    	_coordSettings = missionNamespace getVariable "smgrSettingsCoordSystem";
    	_coordSystem = _coordSettings select 0;
		_unitsSettings = missionNamespace getVariable "smgrSettingsUnitsDist";
		_unitDist = _unitsSettings select 0;
		_unitsSettings = missionNamespace getVariable "smgrSettingsUnitsElev";
		_unitElev = _unitsSettings select 0;
		_unitsSettings = missionNamespace getVariable "smgrSettingsUnitsAngle";
		_unitAngle = _unitsSettings select 0;

		_coordLabel = format ["CSYS %1", _coordSystem];
		_unitDistLabel = format ["DIST %1", _unitDist];
		_unitElevLabel = format ["ELEV %1", _unitElev];
		_unitAngleLabel = format ["ANGL %1", _unitAngle];

    	//Load menu entry list
    	_ctrlMenuListIdc = DLG_SMGR_ScreenSettings_List_IDC;
    	_ctrlMenuList = _dlg displayCtrl _ctrlMenuListIdc;
    	lbClear _ctrlMenuListIdc;

    	{
    		_label = _x select 0;
    		_data = _x select 1;
			_idx =_ctrlMenuList lbAdd _label;
			_ctrlMenuList lbSetData [_idx, _data];
		} foreach [
			[_coordLabel,"smgrSettingsCoordSystem"],
			[_unitDistLabel,"smgrSettingsUnitsDist"],
			[_unitElevLabel,"smgrSettingsUnitsElev"],
			[_unitAngleLabel,"smgrSettingsUnitsAngle"]
		];

		_ctrlMenuList lbSetCurSel 0;
	};

	//Data P2P Screen
	case DLG_SMGR_ScreenDataCom_P2P_IDC:
	{
		(_dlg displayCtrl DLG_SMGR_ScreenDataCom_P2PPorgressText_IDC) ctrlSetText "CONNECTING...";

		_xferPear = missionNamespace getVariable ["smgrXferPear",objNull];
		if (_xferPear != objNull) then {
			[player,"SMGR_fnc_P2PXferSendWpList",_xferPear,false] call BIS_fnc_MP;
		};
	};

    default
    {
     	/* STATEMENT */
    };
};