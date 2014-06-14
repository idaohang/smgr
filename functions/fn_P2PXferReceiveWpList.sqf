#include "controls.h"
disableSerialization;

_waypoints = _this;

[_waypoints] spawn {
	disableSerialization;
	_rxWpList = _this select 0;
	_wpList = missionNamespace getVariable ["smgrWpList",[]];
	_dlg = findDisplay DLG_SMGR_IDD;
	_progressBar = _dlg displayCtrl DLG_SMGR_ScreenDataCom_P2PPorgressBar_IDC;
	_progressText = _dlg displayCtrl DLG_SMGR_ScreenDataCom_P2PPorgressText_IDC;

	if (count _rxWpList <= 0) then {
		_progressText ctrlSetText "NO DATA";
		sleep 3;
	} else {
		_progress = 0;
		_progressStep = 1/(count _rxWpList);

		{
			_wp = [_x select 0,(count _wpList),_x select 2];

			_rxWpExists = false;
			{ if ((_x select 0)==(_wp select 0)) then { _rxWpExists = true; }; } forEach _wpList;

			if (!_rxWpExists) then {
				[_wp] call SMGR_fnc_WpInsert;

				missionNamespace setVariable ["smgrWpList",_wpList];

				//dialog cosmetics
				_progressText ctrlSetText format ["LOADING %1", _x select 0];
			} else {
				_progressText ctrlSetText format ["%1 EXISTS", _x select 0];
			};

			sleep 1;
			_progress = _progress + _progressStep;
			_progressBar progressSetPosition _progress;
			sleep 0.5;
		} forEach _rxWpList;

	};

	[_dlg, DLG_SMGR_ScreenData_IDC] call SMGR_fnc_ShowScreen;
};
