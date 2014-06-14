#include "controls.h"
disableSerialization;

_settings = _this select 0;
_field = _this select 1;

_dlg = findDisplay DLG_SMGR_IDD;
_inputBufferCtrl = _dlg displayCtrl DLG_SMGR_InputBuffer_IDC;
missionNamespace setVariable ["smgrInputBuffer",""];

_refresh = format ["[%1, '%2'] call SMGR_fnc_RefreshWpEdit;", _settings, _field];

switch _field do
{
    case "name":
    {
    	[_dlg,ALPHA_CONTEXT] call SMGR_fnc_MapKeys;
		_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
		_keySel ctrlSetEventHandler ["ButtonClick",_refresh];
		_inputBufferCtrl ctrlSetText "[]";
    };
    case "pos":
    {
    	[_dlg,NUMLOCK_CONTEXT] call SMGR_fnc_MapKeys;
		_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
		_keySel ctrlSetEventHandler ["ButtonClick",_refresh];
		_inputBufferCtrl ctrlSetText "[]";
    };
    case "dist":
    {
    	[_dlg,NUMLOCK_CONTEXT] call SMGR_fnc_MapKeys;
		_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
		_keySel ctrlSetEventHandler ["ButtonClick",_refresh];
		_inputBufferCtrl ctrlSetText "[]";
    };
    case "az":
    {
    	[_dlg,NUMLOCK_CONTEXT] call SMGR_fnc_MapKeys;
		_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
		_keySel ctrlSetEventHandler ["ButtonClick",_refresh];
		_inputBufferCtrl ctrlSetText "[]";
    };

    case "save":
    {
		_wp = _settings select 0;
		_wpDist = _settings select 1;
		_wpAz = _settings select 2;
		_wpName = _wp select 0;
		_wpIndex = _wp select 1;
		_wpPos = _wp select 2;


		_gpsMem = missionNamespace getVariable ["smgrGpsMemory",[]];
		_myLastPos = _gpsMem select 0;
		if ((count _wpPos) == 0) then
		{
			_wpPos = [_myLastPos ,_wpDist, _wpAz] call BIS_fnc_relPos;
		};

		_wpList = missionNamespace getVariable ["smgrWpList",[]];

		if (_wpIndex == count _wpList) then {
			//new wp
			//wplist might not be ordered so we have to find the index at wich to insert the new wp
			_insertIdx = 0;
			{
				if ((_x select 1) == ((count _wpList)-1)) then {
					_insertIdx = _foreachIndex + 1;
				};
			} forEach _wpList;

			if (_insertIdx >= (count _wpList)) then {
				[_wpList,[_wpName,_wpIndex,_wpPos]] call BIS_fnc_arrayPush;
			} else {
				_wpList = [_wpList, [[_wpName,_wpIndex,_wpPos]], _insertIdx] call BIS_fnc_arrayInsert;
			};

		} else {
			//edit wp
			_insertIdx = 0;
			{
				if (_x select 1 == _wpIndex) then {
					_insertIdx = _foreachIndex;
				};
			} forEach _wpList;
			_wpList set [_insertIdx,[_wpName,_wpIndex,_wpPos]];
		};

		missionNamespace setVariable ["smgrWpList",_wpList];
		[_dlg, DLG_SMGR_ScreenWplist_IDC] call SMGR_fnc_ShowScreen;
    };

    default {};
};