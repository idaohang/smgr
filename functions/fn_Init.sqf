if(isDedicated) exitWith {};

[] spawn
{
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};

	smgrKeyOpenDlg = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyOpenDlg" >> "actionKey");
	smgrKeyOpenHud = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyOpenHud" >> "actionKey");
	/*_keyNextWp = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyNexWp" >> "key");
	_keyPrevWp = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyPrevWp" >> "key");
	_keyMark = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyMark" >> "key");
	_keyMod = getText (configFile >> "CfgSettings" >> "KeySMGR" >> "SMGR_Key_Settings" >> "keyMod" >> "key");
	missionNamespace setVariable ["smgrKeyboard",[_keyOpenDlg,_keyOpenHud]];*/

	missionNamespace setVariable ["smgrDlgOpened",false];
	missionNamespace setVariable ["smgrHudOpened",false];

	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call SMGR_fnc_KeyPressed;"];
};