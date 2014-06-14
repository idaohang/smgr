#include "controls.hpp"
#include "constants.hpp"
#include "macros.hpp"

["ComInterfaceController"] call SMGR_fnc_MgmtAssignKeyActions;
["ComInterfaceController"] call SMGR_fnc_MgmtActivateController;
["ComInterfaceController"] call SMGR_fnc_MgmtActivateView;

_port = _this select 0;
_title =  format ["COM%1", _port+1];

while {IsActiveController("ComInterfaceController")} do {
	_menuItems = [];

	// P2P transfert item
	_nearMan = nearestObjects [player, ["Man"], 3];
	if (count _nearMan > 1) then {
			_xferPear = _nearMan select 1;
			NAMESPACE setVariable ["smgrXferPear",_xferPear];
			_item = [format ["P2P %1", name _xferPear],DLG_SMGR_ScreenDataCom_P2P_IDC];
			_menuItems set [count _menuItems, _item];
	};

	[_title, _menuItems] call SMGR_fnc_ComInterfaceControllerUpdateView;
};

["ComInterfaceController"] call SMGR_fnc_MgmtDeactivateView;