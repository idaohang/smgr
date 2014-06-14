#include "constants.hpp"

_removeIdx = _this select 0;
_wpList = NAMESPACE getVariable ["smgrWpList",[]];

_wpList = [_wpList,[],{_x select 1},"ASCEND"] call BIS_fnc_sortBy;
_wpList = [_wpList, _removeIdx] call BIS_fnc_removeIndex;
{ _x set [1, _foreachIndex]; } forEach _wpList;

NAMESPACE setVariable ["smgrWpList",_wpList];