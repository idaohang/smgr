#include "controls.h"
disableSerialization;

_settings = _this select 0;
_field = _this select 1;
_wp = _settings select 0;
_wpDist = _settings select 1;
_wpAz = _settings select 2;
_wpName = _wp select 0;
_wpIndex = _wp select 1;
_wpPos = _wp select 2;

_dlg = findDisplay DLG_SMGR_IDD;

_bufferContent = missionNamespace getVariable ["smgrInputBuffer",""];

switch _field do
{
    case "name":
    {
    	_wpName = _bufferContent;
    };
    case "pos":
    {
    	_pos = _bufferContent;
    	_posLen = [_pos] call CBA_fnc_strLen;
    	if ((_posLen mod 2 == 0) and (_posLen <= 10) and (_posLen > 0)) then
		{
			_posE = [_pos, 0, ((_posLen/2)-1)] call BIS_fnc_trimString;
			_posN = [_pos, (_posLen/2), (_posLen - 1)] call BIS_fnc_trimString;

			_TrimPos = {
				_len = [_this] call CBA_fnc_strLen;
				switch _len do
				{
				    case 4:{ _this = _this + "1";};
				    case 3:{ _this = _this + "01";};
				    case 2:{ _this = _this + "001";};
				    case 1:{ _this = _this + "0001";};
				    default{};
				};
				_this;
			};

			_posE = _posE call _TrimPos;
			_posN = _posN call _TrimPos;
			_pos = _posE+_posN;
			_wpPos = _pos call CBA_fnc_mapGridToPos;
    	} else {
    		[_dlg,"INVALID INPUT"] call SMGR_fnc_ErrorMessage;
    	};
    };
    case "dist":
    {
    	_dist = parseNumber _bufferContent;
    	_wpDist = _dist;
    };
    case "az":
    {
    	_az = parseNumber _bufferContent;
    	if ((_az >= 0)and(_az < 360)) then {
    		_wpAz = _az;
    	} else {
    		[_dlg,"INVALID INPUT"] call SMGR_fnc_ErrorMessage;
    	};
    };
    default{};
};

_inputBufferCtrl = _dlg displayCtrl DLG_SMGR_InputBuffer_IDC;
_inputBufferCtrl ctrlSetText "";

[[_wpName,_wpIndex,_wpPos],_wpDist,_wpAz] call SMGR_fnc_EditWp;