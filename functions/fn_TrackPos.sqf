_dlg = _this select 0;
_refreshRate = _this select 1;
_refreshRate = _refreshRate + floor(random(_refreshRate/2));

while {(missionNamespace getVariable ["smgrPower",false])} do {
	sleep _refreshRate;

	_opMods = missionNamespace getVariable ["smgrSettingsOpMod",["FIX","CONT","STBY"]];
	_msf = missionNamespace getVariable ["smgrMSF",0];
	_gpsMem = missionNamespace getVariable ["smgrGpsMemory", [(getPosASL player),(getPosASL player)]];
	_powerLeft = missionNamespace getVariable ["smgrPowerLeft",7200];

	_op = _opMods select 0;

	if (_op != "STBY") then {
		_powerLeft = _powerLeft - _refreshRate;
		missionNamespace setVariable ["smgrGpsMemory",([] call SMGR_fnc_GpsPull)];
		missionNamespace setVariable ["smgrMSF",0];
		missionNamespace setVariable ["smgrPowerLeft", _powerLeft];
	} else {
		_msf = _msf + _refreshRate;
		missionNamespace setVariable ["smgrMSF",_msf];
	};

	if ((missionNamespace getVariable "smgrSettingsOpMod") select 0 == "FIX") then {
		sleep 1;
		if ((missionNamespace getVariable "smgrSettingsOpMod") select 0 == "FIX") then {
			_opMods = [_opMods, 'right'] call SMGR_fnc_arrayRotate;
			missionNamespace setVariable ["smgrSettingsOpMod",_opMods];
		};
	};
};