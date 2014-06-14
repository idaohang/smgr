#include "controls.hpp"
#include "constants.hpp"

#define SHUTDOWN "[] call SMGR_fnc_MgmtShutdown;"
#define LB_NEXT_SEL(idc) (format ["lbSetCurSel [%1, ((lbCurSel %1)+1)];", idc])
#define LB_PREV_SEL(idc) (format ["lbSetCurSel [%1, ((lbCurSel %1)-1)];", idc])


disableSerialization;

_controllerName = _this select 0;
_dlg = (findDisplay DLG_SMGR_IDD);

[] call SMGR_fnc_MgmtUnassignAllKeyActions;

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
_keyClr = _dlg displayCtrl DLG_SMGR_KeyINP_IDC;

_actionKey0 = "";
_actionKey1 = "";
_actionKey2 = "";
_actionKey3 = "";
_actionKey4 = "";
_actionKey5 = "";
_actionKey6 = "";
_actionKey7 = "";
_actionKey8 = "";
_actionKey9 = "";
_actionKeySel = "";
_actionKeyClr = "";

switch _controllerName do
{
    case "MainMenuController":
    {
        _actionKey1 = SHUTDOWN;
    	_actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenMainMenu_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenMainMenu_List_IDC);
    	_actionKeySel = "[] call SMGR_fnc_MainMenuControllerSelectEntry;";
    };

    case "NavController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey3 = "[] SMGR_fnc_NavControllerSwitchOpMod;";
    	_actionKey4 = "['prev'] call SMGR_fnc_NavControllerSwitchWp;";
		_actionKey6 = "['next'] call SMGR_fnc_NavControllerSwitchWp;";
    	_actionKey9 = "[] call SMGR_fnc_WpMark;";
        _actionKey0 = "['MainMenuController'] call MgmtInitController;";
    };

    case "WpListController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenWplist_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenWplist_List_IDC);
        _actionKey0 = "['MainMenuController'] call MgmtInitController;";
	    _actionKeySel = format ["[(lbCurSel %1)] call SMGR_fnc_WpEditController;",DLG_SMGR_ScreenWplist_List_IDC];
        _actionKeyClr = format ["[lbCurSel %1] call SMGR_fnc_WpDelete;", DLG_SMGR_ScreenWplist_List_IDC];
    };

    case "WpEditController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenWpEdit_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenWpEdit_List_IDC);
        _actionKey0 = "['WpListController'] call MgmtInitController;";
    	_actionKeySel = format ["[(lbData [%1, (lbCurSel %1)])] call SMGR_fnc_WpEditControllerSelectField;", DLG_SMGR_ScreenWpEdit_List_IDC];
    };

    case "SettingsController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenSettings_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenSettings_List_IDC);
        _actionKey0 = "['MainMenuController'] call MgmtInitController;";
        _actionKey4 = format ["['prev',(lbData [%1,(lbCurSel %1)]), (lbCurSel %1)] call SMGR_fnc_SettingsControllerSwitchValue", DLG_SMGR_ScreenSettings_List_IDC];
		_actionKey6 = format ["['next',(lbData [%1,(lbCurSel %1)]), (lbCurSel %1)] call SMGR_fnc_SettingsControllerSwitchValue", DLG_SMGR_ScreenSettings_List_IDC];
    };

    case "DataLinkController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenData_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenData_List_IDC);
        _actionKey0 = "['MainMenuController'] call MgmtInitController;";
    	_actionKeySel = format ["['ComInterfaceController',lbCurSel %1] call SMGR_fnc_MgmtInitController;", DLG_SMGR_ScreenData_List_IDC];
    };

    case "ComInterfaceController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey2 = LB_PREV_SEL(DLG_SMGR_ScreenDataCom_List_IDC);
        _actionKey8 = LB_NEXT_SEL(DLG_SMGR_ScreenDataCom_List_IDC);
        _actionKey0 = "['DataLinkController'] call MgmtInitController;";
    	_actionKeySel = format ["[(lbCurSel %1),(lbData [%2,(lbCurSel %2)])] call SMGR_fnc_MgmtInitController;", DLG_SMGR_ScreenData_List_IDC, DLG_SMGR_ScreenDataCom_List_IDC];
    };

    case "ComInterfaceP2PController":
    {
        _actionKey1 = SHUTDOWN;
        _actionKey0 = "['ComInterfaceController'] call MgmtInitController;";
    };

    case NUMLOCK_CONTEXT:
    {
        _actionKey0 = "['0'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey1 = "['1'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey2 = "['2'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey3 = "['3'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey4 = "['4'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey5 = "['5'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey6 = "['6'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey7 = "['7'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey8 = "['8'] call SMGR_fnc_InputBufferControllerAddNumber;";
        _actionKey9 = "['9'] call SMGR_fnc_InputBufferControllerAddNumber;";
    	_actionKeyClr = "['clear'] call SMGR_fnc_InputBufferControllerAddNumber;";
    };

    case ALPHA_CONTEXT:
    {
    	_actionKey2 = "['up'] call SMGR_fnc_InputBufferControllerAddChar;";
        _actionKey4 = "['back'] call SMGR_fnc_InputBufferControllerAddChar;";
        _actionKey6 = "['next'] call SMGR_fnc_InputBufferControllerAddChar;";
    	_actionKey8 = "['down'] call SMGR_fnc_InputBufferControllerAddChar;";
    	_actionKeyClr = "['clear'] call SMGR_fnc_InputBufferControllerAddChar;";
    };

    default {};
};


_key0 ctrlSetEventHandler ["ButtonClick", _actionKey0];
_key1 ctrlSetEventHandler ["ButtonClick", _actionKey1];
_key2 ctrlSetEventHandler ["ButtonClick", _actionKey2];
_key3 ctrlSetEventHandler ["ButtonClick", _actionKey3];
_key4 ctrlSetEventHandler ["ButtonClick", _actionKey4];
_key5 ctrlSetEventHandler ["ButtonClick", _actionKey5];
_key6 ctrlSetEventHandler ["ButtonClick", _actionKey6];
_key7 ctrlSetEventHandler ["ButtonClick", _actionKey7];
_key8 ctrlSetEventHandler ["ButtonClick", _actionKey8];
_key9 ctrlSetEventHandler ["ButtonClick", _actionKey9];
_keySel ctrlSetEventHandler ["ButtonClick", _actionKeySel];
_keyClr ctrlSetEventHandler ["ButtonClick", _actionKeyClr];