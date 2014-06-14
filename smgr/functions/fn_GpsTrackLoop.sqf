#include "constants.hpp"
private [
	"_gpsMem",
	"_gpsMemNew",
	"_sentence",
	"_refreshRate",
	"_op",
	"_powerLeft",
	"_opMods"
];

while {(NAMESPACE getVariable ["smgrPower",false])} do {

	_refreshRate = NAMESPACE getVariable ["smgrSettingsGpsRefreshRate",2];
	sleep _refreshRate;

	_opMods = NAMESPACE getVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];
	_gpsMem = NAMESPACE getVariable ["smgrGpsMemory", []];
	_powerLeft = NAMESPACE getVariable ["smgrPowerLeft",7200];

	_op = _opMods select 0;

	if (_op != "STBY") then {
		// use battery
		_powerLeft = _powerLeft - _refreshRate;
		NAMESPACE setVariable ["smgrPowerLeft", _powerLeft];

		// insert sentence in gps memory
		_sentence = [] call SMGR_fnc_GpsGetSentence;
		_gpsMemNew = [_sentence];
		[_gpsMemNew, _gpsMem] call BIS_fnc_arrayPushStack;
		if ((count _gpsMemNew) > 50) then { _gpsMemNew call BIS_fnc_arrayPop; };
		NAMESPACE setVariable ["smgrGpsMemory",_gpsMem];
	};

	// If we are just fixing once, set OpMod back to STBY
	if ((NAMESPACE getVariable "smgrSettingsOpMod") select 0 == "FIX") then {
		//wait 1sec to let the player switch to CONT mode if desired
		sleep 1;
		// If mode is still FIX, set OpMod back to STBY
		if ((NAMESPACE getVariable "smgrSettingsOpMod") select 0 == "FIX") then {
			_opMods = [_opMods, 'right'] call SMGR_fnc_arrayRotate;
			NAMESPACE setVariable ["smgrSettingsOpMod",_opMods];
		};
	};
};