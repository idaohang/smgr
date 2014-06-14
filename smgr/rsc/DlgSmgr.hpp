class DlgSmgr
{
	idd = DLG_SMGR_IDD;
	name = "DlgSmgr";
	movingEnable = true;
	duration  = 999999;
	objects[] = {};
	controlsBackground[] = {Smgr};
	controls[] = {};
	onLoad = "(_this select 0) call SMGR_fnc_Load;";

	class Smgr : RscSmgrMainBox
	{
		idc = DLG_SMGR_Smgr_IDC;
		x = SMGR_TOTAL_X;
		y = SMGR_TOTAL_Y;
		w = SMGR_TOTAL_W;
		h = SMGR_TOTAL_H;
		moving = 1;

		class Controls {

			class SmgrBackground: RscPicture
			{
				x = 0;
				Y = 0;
				w = 0.275;
				h = 0.785714;
				moving = 1;
				text = "smgr\data\smgr_background_ca.paa";
			};
			
			class ScreenPowerOn : RscSmgrScreen
			{
				idc = DLG_SMGR_ScreenPowerOn_IDC;

				class Controls
				{
					class InitLogo: RscPicture
					{
						idc = DLG_SMGR_ScreenPowerOn_InitLogo_IDC;
						text = "smgr\data\smgr_gms_logo.paa";
						x = SMGR_SCREEN_XPADDING;
						y = SMGR_SCREEN_YPADDING;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = (SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING))*0.6;
					};
					class product: RscSmgrText
					{
						text = "AN/PNC-212 SMGR"; //--- ToDo: Localize;
						x = SMGR_SCREEN_XPADDING;
						y = 0.115;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = SMGR_TEXTLINE_H;
					};
					class hw_rev: RscSmgrText
					{
						text = "HW Ver. 1.0"; //--- ToDo: Localize;
						x = SMGR_SCREEN_XPADDING;
						y = 0.115 + SMGR_TEXTLINE_H;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = 0.02;
						size = 0.02;
					};
					class sw_rev: RscSmgrText
					{
						text = "SW Ver. 0.2"; //--- ToDo: Localize;
						x = SMGR_SCREEN_XPADDING;
						y = 0.115 + 0.04;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = 0.02;
						size = 0.02;
					};
					class InitText: RscSmgrText
					{
						idc = DLG_SMGR_ScreenPowerOn_InitText_IDC;
						text = "INITIALIZING"; //--- ToDo: Localize;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "center";
							color = SMGR_TEXT_COLOR_HEX;
						};
						x = SMGR_SCREEN_XPADDING;
						y = 0.18;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = SMGR_TEXTLINE_H;
					};
					class PowerProgressBar : RscSmgrProgressBar
					{
						idc = DLG_SMGR_ScreenPowerOn_PowerProgressBar_IDC;
						x = SMGR_SCREEN_XPADDING;
						y = 0.21;
						w = SMGR_SCREEN_W - 2 * SMGR_SCREEN_XPADDING;
						h = SMGR_TEXTLINE_H;
					};
					class LoadingText: RscSmgrText
					{
						idc = DLG_SMGR_ScreenPowerOn_LoadingText_IDC;
						x = SMGR_SCREEN_XPADDING;
						y = 0.24;
						w = SMGR_SCREEN_W - 2 * SMGR_SCREEN_XPADDING;
						h = SMGR_TEXTLINE_H;
					};
				};
			};

			class ScreenMainMenu : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenMainMenu_IDC;

				class Controls 
				{
					class MainMenuTitle : RscSmgrMenuTitle
					{
						text = "MAIN MENU";
					};
					class MainMenuList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenMainMenu_List_IDC;
					};
				};
			};
			class ScreenSettings : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenSettings_IDC;

				class Controls 
				{
					class SettingsTitle : RscSmgrMenuTitle
					{
						text = "SETTINGS";
					};
					class SettingsList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenSettings_List_IDC;
					};
				};
			};
			class ScreenWplist : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenWplist_IDC;

				class Controls 
				{
					class WplistTitle : RscSmgrMenuTitle
					{
						text = "WP LIST";
					};
					class WplistList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenWplist_List_IDC;
					};
				};
			};
			class ScreenData : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenData_IDC;

				class Controls 
				{
					class ScreenDataTitle : RscSmgrMenuTitle
					{
						text = "DATA LINK";
					};
					class ScreenDataList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenData_List_IDC;
					};
				};
			};
			class ScreenDataCom : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenDataCom_IDC;

				class Controls 
				{
					class ScreenDataComTitle : RscSmgrMenuTitle
					{
						idc = DLG_SMGR_ScreenDataCom_Title_IDC;
					};
					class ScreenDataComList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenDataCom_List_IDC;
					};
				};
			};
			class ScreenDataComP2P : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenDataCom_P2P_IDC;

				class Controls 
				{
					class ScreenDataTitle : RscSmgrMenuTitle
					{
						text = "P2P XFER";
					};
					class P2PProgressBar : RscSmgrProgressBar
					{
						idc = DLG_SMGR_ScreenDataCom_P2PPorgressBar_IDC;
						x = SMGR_SCREEN_XPADDING;
						y = 0.21;
						w = SMGR_SCREEN_W - 2 * SMGR_SCREEN_XPADDING;
						h = SMGR_TEXTLINE_H;
					};
					class P2PProgressText: RscSmgrText
					{
						idc = DLG_SMGR_ScreenDataCom_P2PPorgressText_IDC;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "center";
							color = SMGR_TEXT_COLOR_HEX;
						};
						x = SMGR_SCREEN_XPADDING;
						y = 0.18;
						w = SMGR_SCREEN_W - (2 * SMGR_SCREEN_XPADDING);
						h = SMGR_TEXTLINE_H;
					};
				};
			};
			class ScreenWpEdit : RscSmgrScreenMenu
			{
				idc = DLG_SMGR_ScreenWpEdit_IDC;

				class Controls 
				{
					class WpEditTitle : RscSmgrMenuTitle
					{
						idc = DLG_SMGR_ScreenWpEdit_Title_IDC;
						text = "WP EDIT/NEW";
					};
					class WpEditList : RscSmgrMenuList
					{
						idc = DLG_SMGR_ScreenWpEdit_List_IDC;
					};
				};
			};
			class ScreenNav : RscSmgrScreen
			{
				idc = DLG_SMGR_ScreenNav_IDC;
				class Controls
				{
					class Time: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_Time_IDC;
						y = 0.005;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "left";
							color = SMGR_TEXT_COLOR_HEX;
						};
					};
					class Batt: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_Batt_IDC;
						y = 0.005 + SMGR_TEXTLINE_H;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "left";
							color = SMGR_TEXT_COLOR_HEX;
						};
					};
					class Status: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_Status_IDC;
						y = 0.005 + 2 * SMGR_TEXTLINE_H;
					};
					class Error: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_Error_IDC;
						y = 0.005 + 2 * SMGR_TEXTLINE_H;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "right";
							color = SMGR_TEXT_COLOR_HEX;
						};
					};
					class MainText: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_MainText_IDC;
						y = 0.085;
						h = 1.3 * SMGR_TEXTLINE_H;	
						size = 1.3 * SMGR_TEXT_SIZE;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "center";
							color = SMGR_TEXT_COLOR_HEX;
						};
					};
					class MyBearing: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_MyBearing_IDC;
						y = 0.12;
					};
					class MyAltitude: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_MyAltitude_IDC;
						y = 0.12 + SMGR_TEXTLINE_H;
					};

					class WpNum: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_WpNum_IDC;
						y = 0.185;
					};
					class WpGrid: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_WpGrid_IDC;
						y = 0.185 + SMGR_TEXTLINE_H;
					};
					class WpRoute: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_WpRoute_IDC;
						y = 0.185 + (2 * SMGR_TEXTLINE_H);
					};
					class WpDistance: RscSmgrTextLine
					{
						idc = DLG_SMGR_ScreenNav_WpDistance_IDC;
						y = 0.185 + (3 * SMGR_TEXTLINE_H);
					};
				};
			};

			class ScreenErrorMessage : RscSmgrScreen
			{
				idc = DLG_SMGR_ScreenErrorMessage_IDC;

				class Controls
				{
					class EMBackground: RscSmgrBackground
					{
						idc = DLG_SMGR_ScreenErrorMessage_BG_IDC;
						x = SMGR_SCREEN_W * 0.05;
						y = 0.10;
						w = SMGR_SCREEN_W * 0.89;
						h = 3 * SMGR_TEXTLINE_H;
						colorBackground[] = {0,0,0,1};
					};
					class EMText : RscSmgrText
					{
						idc = DLG_SMGR_ScreenErrorMessage_Text_IDC;
						x = SMGR_SCREEN_W * 0.05;
						y = 0.10 + SMGR_TEXTLINE_H;
						w = SMGR_SCREEN_W * 0.89;
						h = SMGR_TEXTLINE_H;
						class Attributes
						{
							font = SMGR_TEXT_FONT;
							align = "center";
							valign = "middle";
							color = "#FFFFFF";
						};
					};
				};

			};

			class InputBuffer: RscSmgrInputBufferText
			{
				idc = DLG_SMGR_InputBuffer_IDC;
			};
			class Key0: RscSmgrKey
			{
				idc = DLG_SMGR_Key0_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA);
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 3;
			};
			class Key1: RscSmgrKey
			{
				idc = DLG_SMGR_Key1_IDC;
				x = SMGR_KEYPAD_ORIGIN_X;
				y = SMGR_KEYPAD_ORIGIN_Y;
			};
			class Key2: RscSmgrKey
			{
				idc = DLG_SMGR_Key2_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA);
				y = SMGR_KEYPAD_ORIGIN_Y;
			};
			class Key3: RscSmgrKey
			{
				idc = DLG_SMGR_Key3_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA) * 2;
				y = SMGR_KEYPAD_ORIGIN_Y;
			};
			class Key4: RscSmgrKey
			{
				idc = DLG_SMGR_Key4_IDC;
				x = SMGR_KEYPAD_ORIGIN_X;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25);
			};
			class Key5: RscSmgrKey
			{
				idc = DLG_SMGR_Key5_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA);
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25);
			};
			class Key6: RscSmgrKey
			{
				idc = DLG_SMGR_Key6_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA) * 2;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25);
			};
			class Key7: RscSmgrKey
			{
				idc = DLG_SMGR_Key7_IDC;
				x = SMGR_KEYPAD_ORIGIN_X;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 2;
			};
			class Key8: RscSmgrKey
			{
				idc = DLG_SMGR_Key8_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA);
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 2;
			};
			class Key9: RscSmgrKey
			{
				idc = DLG_SMGR_Key9_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA) * 2;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 2;
			};
			class KeyINP: RscSmgrKey
			{
				idc = DLG_SMGR_KeyINP_IDC;
				x = SMGR_KEYPAD_ORIGIN_X;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 3;
			};
			class KeySEL: RscSmgrKey
			{
				idc = DLG_SMGR_KeySEL_IDC;
				x = SMGR_KEYPAD_ORIGIN_X + (SMGR_KEYPAD_KEY_SPA) * 2;
				y = SMGR_KEYPAD_ORIGIN_Y + (SMGR_KEYPAD_KEY_SPA *1.25) * 3;
			};

		};

	};

};



