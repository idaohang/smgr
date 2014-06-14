#include "constants.hpp"

_controllerName = _this select 0;
NAMESPACE setVariable ["smgrActiveController",_controllerName];

player globalChat format ["%1 is now the active controller", _controllerName];