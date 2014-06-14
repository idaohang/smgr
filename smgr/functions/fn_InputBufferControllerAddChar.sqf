#include "controls.hpp"
#include "constants.hpp"

_action = _this select 0;

_alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"];

_buffer = NAMESPACE getVariable ["smgrInputBuffer",""];

_bufferSize = [_buffer] call CBA_fnc_strLen;
_bufferBack = [_buffer,0,(_bufferSize -2)] call BIS_fnc_trimString;

if (_bufferSize == 1) then {_bufferBack = "";};

_lastChar = [_buffer,(_bufferSize -1),(_bufferSize -1)] call BIS_fnc_trimString;

_lastCharIdx = _alphabet find _lastChar;

switch _action do
{
    case 'next':
    {
    	_buffer = _buffer + (_alphabet select 0);
    };
    case 'back':
    {
    	_buffer = _bufferBack;
    };
   	case 'up':
    {
    	if (_lastCharIdx >= (count _alphabet) -1) then { _lastCharIdx = -1; };
    	_newChar = _alphabet select (_lastCharIdx + 1);
    	_buffer =  _bufferBack + _newChar;
    };
    case 'down':
    {
    	if (_lastCharIdx <= 0) then { _lastCharIdx = count _alphabet; };
    	_newChar = _alphabet select (_lastCharIdx - 1);
    	_buffer =  _bufferBack + _newChar;
    };
    case 'clear':
    {
    	_buffer = "";
    };

    default
    {
     	/* STATEMENT */
    };
};

NAMESPACE setVariable ["smgrInputBuffer", _buffer];