#include "controls.hpp"
#include "constants.hpp"

_offset = _this select 0;
_setting = _this select 1;

_values = NAMESPACE getVariable _setting;

switch _offset do
{
    case "next": { _values = [_values,"left"] call SMGR_fnc_arrayRotate; };
    case "prev": { _values = [_values,"right"] call SMGR_fnc_arrayRotate; };
    default {};
};

NAMESPACE setVariable [_setting,_values];