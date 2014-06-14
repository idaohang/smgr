#include "functions\controls.hpp"

class CfgSmgr
{

	class MainMenu {
		class ItemNav {
			text = "NAV";
			data = "NavController";
		};
		class ItemWpList {
			text = "WP LIST";
			data = "WpListController";
		};
		class ItemDataLink {
			text = "DATA LINK";
			data = "DataLinkController";
		};
		class ItemSettings {
			text = "SETTINGS";
			data = "SettingsController";
		};
	};

	class Settings {
		class CoordinatesSystem {
			text = "CSYS";
			variable = "smgrSettingsCoordSystem";
			values[] = {"MGRS"};
		};
		class DistanceUnits {
			text = "DIST";
			variable = "smgrSettingsUnitsDist";
			values[] = {"Metric","English","Nautical"};
		};
		class ElevationUnits {
			text = "ELEV";
			variable = "smgrSettingsUnitsElev";
			values[] = {"Meters","Feet"};
		};
		class AngleUnits {
			text = "ANGL";
			variable = "smgrSettingsUnitsAngle";
			values[] = {"Degrees","Mils"};
		};
	};

	class Controller
	{
		initFunction = "";
		view = 0;
		type = "static";
	};

	class OverlayController : Controller
	{
		type = "overlay";
	};

	class Controllers 
	{
		class MainMenuController : Controller {
			initFunction = "_this spawn SMGR_fnc_MainMenuController";
			view = DLG_SMGR_ScreenMainMenu_IDC;
		};

		class NavController : Controller {
			initFunction = "_this spawn SMGR_fnc_NavController";
			view = DLG_SMGR_ScreenNav_IDC;
		};

		class WpListController : Controller {
			initFunction = "_this spawn SMGR_fnc_WpListController";
			view = DLG_SMGR_ScreenWplist_IDC;
		};

		class WpEditController : Controller {
			initFunction = "_this spawn SMGR_fnc_WpEditController";
			view = DLG_SMGR_ScreenWpEdit_IDC;
		};

		class BootController : Controller {
			initFunction = "_this spawn SMGR_fnc_BootController";
			view = DLG_SMGR_ScreenPowerOn_IDC;
		};

		class ComInterfaceController : Controller {
			initFunction = "_this spawn SMGR_fnc_ComInterfaceController";
			view = DLG_SMGR_ScreenDataCom_IDC;
		};

		class ComInterfaceP2PController : Controller {
			initFunction = "_this spawn SMGR_fnc_ComInterfaceController";
			view = DLG_SMGR_ScreenDataCom_P2P_IDC;
		};

		class DataLinkController : Controller {
			initFunction = "_this spawn SMGR_fnc_DataLinkController";
			view = DLG_SMGR_ScreenData_IDC;
		};

		class ErrorMessageController : OverlayController {
			initFunction = "_this spawn SMGR_fnc_ErrorMessageController";
			view = DLG_SMGR_ScreenErrorMessage_IDC;
		};

		class InputBufferController : OverlayController {
			initFunction = "_this spawn SMGR_fnc_InputBufferController";
			view = DLG_SMGR_InputBuffer_IDC;
		};

		class SettingsController : Controller {
			initFunction = "_this spawn SMGR_fnc_SettingsController";
			view = DLG_SMGR_ScreenSettings_IDC;
		};

	};
};