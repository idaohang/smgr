#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"

["ComInterfaceP2PController"] call SMGR_fnc_MgmtAssignKeyActions;
["ComInterfaceP2PController"] call SMGR_fnc_MgmtActivateController;
["ComInterfaceP2PController"] call SMGR_fnc_MgmtActivateView;

_wpList = NAMESPACE getVariable ["smgrWpList",[]];
_transferPeer = NAMESPACE getVariable ["smgrTransferPeer",objNull];
_isTransferFinished = false;


NAMESPACE setVariable ["smgrReceivedWaypoints",[]];
if (_transferPeer != objNull) then {
	[player,"SMGR_fnc_ControllerComInterfaceP2PSend",_transferPeer,false] call BIS_fnc_MP;
};

while {IsActiveController("ComInterfaceP2PController")} do {

	if (_transferFinished) then {

		_transferProgress = 1;
		_transferText = "Transfer finished";
		[_transferProgress,_transferText] call SMGR_fnc_ComInterfaceP2PControllerUpdateView;

	} else {

		if (count (NAMESPACE getVariable ["smgrReceivedWaypoints",[]]) < 1) then {

			_transferProgress = 0;
			_transferText = format ["Waiting for data", name _transferPeer];
			[_transferProgress,_transferText] call SMGR_fnc_ComInterfaceP2PControllerUpdateView;

		} else {

			_receivedWaypoints = NAMESPACE getVariable "smgrReceivedWaypoints";
			_transferStep = 1/(count _receivedWaypoints);
			{
				_waypointToAdd = [_x select 0,(count _wpList),_x select 2];
				_ExistsWaypointToAdd = false;
				{
					if ((_x select 0)==(_waypointToAdd select 0)) then { _ExistsWaypointToAdd = true; };
				} forEach _wpList;

				if (!_ExistsWaypointToAdd) then {
					[_waypointToAdd] call SMGR_fnc_WpInsert;
					_transferText = format ["%1 Transfered", _x select 0];
				} else {
					_transferText = format ["%1 Exists", _x select 0];
				};

				_transferProgress = _transferProgress + _transferStep;

				sleep 2;
				[_transferProgress,_transferText] call SMGR_fnc_ComInterfaceP2PControllerUpdateView;
			} forEach _receivedWaypoints;

			_isTransferFinished = true;
		};

	};

};

["ComInterfaceP2PController"] call SMGR_fnc_MgmtDeactivateView;