
#include "constants.hpp"

_wpList = NAMESPACE getVariable ["smgrWpList",[]];
_markCount = NAMESPACE getVariable ["smgrMarkCount",0];
_markCount = _markCount+1;
NAMESPACE setVariable ["smgrMarkCount",_markCount];

_pos = getPosASL player;
_markName = format ["MARK-%1", _markCount];

_wp = [_markName,(count _wpList),_pos];

[_wp] call SMGR_fnc_WpInsert;