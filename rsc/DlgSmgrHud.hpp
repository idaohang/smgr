class DlgSmgrHud : DlgSmgr
{
	idd = DLG_SMGRs_IDD;
	name = "DlgSmgrHud";
	movingEnable = false;
	duration  = 999999;
	objects[] = {};
	controlsBackground[] = {};
	controls[] = { Smgr };
	onLoad = "(_this select 0) call SMGR_fnc_LoadHud;";
};