#include "controls.hpp"
#include "constants.hpp"

["BootController"] call SMGR_fnc_MgmtActivateController;
["BootController"] call SMGR_fnc_MgmtActivateView;

// set power to ON
NAMESPACE setVariable ["smgrPower",true];
// reset OpMod to quick fix
NAMESPACE setVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];
// start the gps tracking loop
[] spawn SMGR_fnc_GpsTrackLoop;


//view control

// if we haven't started the power-on sequence countdown yet, then do it now
if (NAMESPACE getVariable ["smgrPowerProgress",0] == 0) then {
	[] spawn {
		_progress = 0;

		while {_progress <= 1.5} do {
			_progress = _progress +0.02;
			NAMESPACE setVariable ["smgrPowerProgress",_progress];
			sleep 0.1;
		};
	};
};

// update boot view until boot sequence cowntdown ends
while {(NAMESPACE getVariable ["smgrPowerProgress",0] <= 1)} do {

	_progress = NAMESPACE getVariable ["smgrPowerProgress",0];
	_progressText = switch true do {
	    case (_progress < 0.7): { "Self Test..."; };
	    default { "First Fix..."; };
	};

	[_progress,_progressText] call SMGR_fnc_BootControllerUpdateView;

	sleep 0.1;
};

// go to main menu
["MainMenuController"] call SMGR_fnc_MgmtInitController;