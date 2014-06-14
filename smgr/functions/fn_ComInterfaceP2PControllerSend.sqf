
#include "constants.hpp"

_transferPeer = _this;

_sentWaypoints = NAMESPACE getVariable ["smgrWpList",[]];
[_sentWaypoints,"SMGR_fnc_ControllerComInterfaceP2PReceive",_transferPeer,false] call BIS_fnc_MP;