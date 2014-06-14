#include "controls.hpp"
#include "constants.hpp"

_str = _this select 0;

_value = "";
if (_str == "clear") then {
	_value = "";
} else {
	_value = (NAMESPACE getVariable ["smgrInputBuffer",""]) + _str;
};

NAMESPACE setVariable ["smgrInputBuffer", _value];