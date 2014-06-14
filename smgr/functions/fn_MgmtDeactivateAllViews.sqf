#include "controls.hpp"
#include "constants.hpp"
private [
	"_dlg",
	"_controllers",
	"_i",
	"_controllerName"
];

disableSerialization;
_dlg = [_this, 0, (findDisplay DLG_SMGR_IDD), [(findDisplay 0)]] call bis_fnc_param;;

_controllers = CONFIG_FILE >> "CfgSmgr" >> "Controllers";

for "_i" from 0 to (count _controllers - 1) do {
	_controllerName = configName (_controllers select _i );
	[_controllerName,_dlg] call SMGR_fnc_MgmtDeactivateView;
};