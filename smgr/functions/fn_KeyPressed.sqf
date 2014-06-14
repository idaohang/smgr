_handled = false;

if ((_this select 1) in actionKeys smgrKey) then {
	if ("ItemSMGR" in assignedItems player) then {
		if (!isNull	(findDisplay DLG_SMGRs_IDD)) then {
			closeDialog "DlgSmgrHud";
		};
		createDialog "DlgSmgr";
	};
	_handled = true;
};

_handled;