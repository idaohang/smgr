if(isDedicated) exitWith {};

[] spawn
{
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};

	smgrKey = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "key" >> "actionKey");
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call SMGR_fnc_KeyPressed;"];
};