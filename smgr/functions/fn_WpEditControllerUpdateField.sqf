/*
    File: fn_ControllerWpEditUpdateField.sqf
    Author: <G.I.D> Sacha

    Description:
    Updates the given field with the value currently contained by the input buffer

    Parameters:
    0: Field name (string)

    Returns:
    nothing
*/

#include "constants.hpp"

_field = _this select 0;
_bufferContent = NAMESPACE getVariable ["smgrInputBuffer",""];

_wpTempEdit = NAMESPACE getVariable "smgrWpTempEdit";
_wp = _wpTempEdit select 0;
_wpDist = _wpTempEdit select 1;
_wpAz = _wpTempEdit select 2;
_wpName = _wp select 0;
_wpIndex = _wp select 1;
_wpPos = _wp select 2;

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

_newWpTempEdit = [[_wpName , _wpIndex, _wpPos],_wpDist, _wpAz];
NAMESPACE setVariable ["smgrWpTempEdit",_newWpTempEdit];