_handled = false;

if ((_this select 1) in actionKeys smgrKeyOpenDlg) then {
	if ("ItemSMGR" in assignedItems player) then {

		if (missionNamespace getVariable "smgrHudOpened") then {
			("SmgrRscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
			missionNamespace setVariable ["smgrHudOpened",false];
		};

		if (missionNamespace getVariable "smgrDlgOpened") then {
			closeDialog 0;
			missionNamespace setVariable ["smgrDlgOpened",false];
		} else {
			createDialog "DlgSmgr";
			missionNamespace setVariable ["smgrDlgOpened",true];
		};

	};
	_handled = true;
};


if ((_this select 1) in actionKeys smgrKeyOpenHud) then {
	if ("ItemSMGR" in assignedItems player) then {

		if (missionNamespace getVariable "smgrDlgOpened") then {
			closeDialog 0;
			missionNamespace setVariable ["smgrDlgOpened",false];
		};


		if (missionNamespace getVariable "smgrHudOpened") then {
			("SmgrRscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
			missionNamespace setVariable ["smgrHudOpened",false];
		} else {
			('SmgrRscLayer' call BIS_fnc_rscLayer) cutRsc ['DlgSmgrHud', 'PLAIN', 0.5, true];
			missionNamespace setVariable ["smgrHudOpened",true];
		};

	};
	_handled = true;
};

_handled;