#include "controls.h"
disableSerialization;

_dlg = _this select 0;
_context = _this select 1;
//remove EHs before reassingning (except numlock)
{
	(_dlg displayCtrl _x) ctrlRemoveAllEventHandlers "ButtonClick";
} forEach [
	DLG_SMGR_Key0_IDC,
	DLG_SMGR_Key1_IDC,
	DLG_SMGR_Key2_IDC,
	DLG_SMGR_Key3_IDC,
	DLG_SMGR_Key4_IDC,
	DLG_SMGR_Key5_IDC,
	DLG_SMGR_Key6_IDC,
	DLG_SMGR_Key7_IDC,
	DLG_SMGR_Key8_IDC,
	DLG_SMGR_Key9_IDC,
	DLG_SMGR_KeySEL_IDC,
	DLG_SMGR_KeyINP_IDC
];

//assign EHs
_key0 = _dlg displayCtrl DLG_SMGR_Key0_IDC;
_key1 = _dlg displayCtrl DLG_SMGR_Key1_IDC;
_key2 = _dlg displayCtrl DLG_SMGR_Key2_IDC;
_key3 = _dlg displayCtrl DLG_SMGR_Key3_IDC;
_key4 = _dlg displayCtrl DLG_SMGR_Key4_IDC;
_key5 = _dlg displayCtrl DLG_SMGR_Key5_IDC;
_key6 = _dlg displayCtrl DLG_SMGR_Key6_IDC;
_key7 = _dlg displayCtrl DLG_SMGR_Key7_IDC;
_key8 = _dlg displayCtrl DLG_SMGR_Key8_IDC;
_key9 = _dlg displayCtrl DLG_SMGR_Key9_IDC;
_keySel = _dlg displayCtrl DLG_SMGR_KeySEL_IDC;
_keyInp = _dlg displayCtrl DLG_SMGR_KeyINP_IDC;


switch _context do
{
    case DLG_SMGR_ScreenMainMenu_IDC:
    {
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenMainMenu_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenMainMenu_List_IDC];
    	_openEntry = format ["[(findDisplay %1),(((findDisplay %1) displayCtrl %2) lbvalue (lbCurSel %2))] call SMGR_fnc_ShowScreen;", DLG_SMGR_IDD, DLG_SMGR_ScreenMainMenu_List_IDC];
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];

    	_keySel ctrlSetEventHandler ["ButtonClick",_openEntry];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];

    	_mapInputChar = format ["[(findDisplay %1),%2] call SMGR_fnc_MapKeys",DLG_SMGR_IDD,ALPHA_CONTEXT];
    	_key7 ctrlSetEventHandler ["ButtonClick",_mapInputChar];
    };

    case DLG_SMGR_ScreenNav_IDC:
    {
    	_wpNext = "['next'] call SMGR_fnc_SwitchWp;";
		_wpPrev = "['prev'] call SMGR_fnc_SwitchWp;";
		_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenMainMenu_IDC];
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
    	_mark = "[] call SMGR_fnc_Mark;";
    	_switchMod = "missionNamespace setVariable ['smgrSettingsOpMod', ([missionNamespace getVariable 'smgrSettingsOpMod','left'] call SMGR_fnc_arrayRotate)];";

		_key0 ctrlSetEventHandler ["ButtonClick",_back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key3 ctrlSetEventHandler ["ButtonClick",_switchMod];
		_key4 ctrlSetEventHandler ["ButtonClick",_wpPrev];
		_key6 ctrlSetEventHandler ["ButtonClick",_wpNext];
		_key9 ctrlSetEventHandler ["ButtonClick",_mark];
    };

    case DLG_SMGR_ScreenWplist_IDC:
    {
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenWplist_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenWplist_List_IDC];
    	_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenMainMenu_IDC];
	    _editWp = format ["[(lbCurSel %1)] call SMGR_fnc_toEditWp;",DLG_SMGR_ScreenWplist_List_IDC];
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
        _deleteWp = format ["[lbCurSel %1] call SMGR_fnc_DeleteWp;", DLG_SMGR_ScreenWplist_List_IDC];

    	_keySel ctrlSetEventHandler ["ButtonClick",_editWp];
        _keyInp ctrlSetEventHandler ["ButtonClick",_deleteWp];
    	_key0 ctrlSetEventHandler ["ButtonClick",_back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
    };

    case DLG_SMGR_ScreenWpEdit_IDC:
    {
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenWpEdit_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenWpEdit_List_IDC];
    	_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenWplist_IDC];
    	_editEntry = format ["[%1] call SMGR_fnc_EditWpEntry;", DLG_SMGR_ScreenWpEdit_List_IDC];

    	_keySel ctrlSetEventHandler ["ButtonClick",_editEntry];
    	_key0 ctrlSetEventHandler ["ButtonClick",_back];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
    };

    case DLG_SMGR_ScreenSettings_IDC:
    {
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenSettings_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenSettings_List_IDC];
		_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenMainMenu_IDC];
		_setNext = format ["['next',(lbData [%1,(lbCurSel %1)]), (lbCurSel %1)] call SMGR_fnc_SwitchSetting", DLG_SMGR_ScreenSettings_List_IDC];
		_setPrev = format ["['prev',(lbData [%1,(lbCurSel %1)]), (lbCurSel %1)] call SMGR_fnc_SwitchSetting", DLG_SMGR_ScreenSettings_List_IDC];
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];

    	_key0 ctrlSetEventHandler ["ButtonClick",_back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
		_key4 ctrlSetEventHandler ["ButtonClick",_setPrev];
		_key6 ctrlSetEventHandler ["ButtonClick",_setNext];
    };

    case DLG_SMGR_ScreenData_IDC:
    {
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
    	_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenMainMenu_IDC];
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenData_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenData_List_IDC];
    	_selectCom = format ["[lbCurSel %1] call SMGR_fnc_OpenCom;", DLG_SMGR_ScreenData_List_IDC];

    	_keySel ctrlSetEventHandler ["ButtonClick", _selectCom];
    	_key0 ctrlSetEventHandler ["ButtonClick", _back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
    };

    case DLG_SMGR_ScreenDataCom_IDC:
    {
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
    	_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenData_IDC];
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenDataCom_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenDataCom_List_IDC];
    	_link = format ["[(lbCurSel %1),(lbValue [%2,(lbCurSel %2)])] call SMGR_fnc_DataLink;", DLG_SMGR_ScreenData_List_IDC, DLG_SMGR_ScreenDataCom_List_IDC];

    	_key0 ctrlSetEventHandler ["ButtonClick", _back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
    	_keySel ctrlSetEventHandler ["ButtonClick", _link];
    };

    case DLG_SMGR_ScreenDataCom_Glasses_IDC:
    {
    	_powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
    	_back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenData_IDC];
    	_lbNextSel = format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", DLG_SMGR_ScreenDataCom_List_IDC];
    	_lbPrevSel = format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", DLG_SMGR_ScreenDataCom_List_IDC];
    	_exec = format ["[lbData [%1, (lbCurSel %1)]] call SMGR_fnc_TacGlasses;", DLG_SMGR_ScreenDataCom_Glasses_List_IDC];

    	_key0 ctrlSetEventHandler ["ButtonClick", _back];
    	_key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    	_key2 ctrlSetEventHandler ["ButtonClick",_lbPrevSel];
    	_key8 ctrlSetEventHandler ["ButtonClick",_lbNextSel];
    	_keySel ctrlSetEventHandler ["ButtonClick", _exec];
    };

    case DLG_SMGR_ScreenDataCom_P2P_IDC:
    {
        _powerOFF = format ["[(findDisplay %1)] call SMGR_fnc_PowerOFF;", DLG_SMGR_IDD];
        _back = format ["[(findDisplay %1), %2] call SMGR_fnc_ShowScreen;",DLG_SMGR_IDD ,DLG_SMGR_ScreenData_IDC];

        _key0 ctrlSetEventHandler ["ButtonClick", _back];
        _key1 ctrlSetEventHandler ["ButtonClick",_powerOFF];
    };

    case NUMLOCK_CONTEXT:
    {
    	{
			_ctrl = _x;
			_bufferize = format ["['%1'] call SMGR_fnc_InputBufferAddNumber;", _foreachIndex];
			_ctrl ctrlSetEventHandler ["ButtonClick",_bufferize];
		} forEach [_key0, _key1, _key2, _key3, _key4, _key5, _key6, _key7, _key8, _key9 ];

    	_keyInp ctrlSetEventHandler ["ButtonClick","['clear'] call SMGR_fnc_InputBufferAddNumber;"];
    };

    case ALPHA_CONTEXT:
    {
    	_key2 ctrlSetEventHandler ["ButtonClick","['up'] call SMGR_fnc_InputBufferAddChar;"];
    	_key8 ctrlSetEventHandler ["ButtonClick","['down'] call SMGR_fnc_InputBufferAddChar;"];
    	_key4 ctrlSetEventHandler ["ButtonClick","['back'] call SMGR_fnc_InputBufferAddChar;"];
    	_key6 ctrlSetEventHandler ["ButtonClick","['next'] call SMGR_fnc_InputBufferAddChar;"];
    	_keyInp ctrlSetEventHandler ["ButtonClick","['clear'] call SMGR_fnc_InputBufferAddChar;"];
    };

    default {};
};
