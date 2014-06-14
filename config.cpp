class CfgPatches
{
	class GMS_SMGR
	{
		author[] = {"GMS","<G.I.D> Emperias","<G.I.D> Sacha"};
		authorUrl = "http://www.clan-gid.fr";
		units[] = {};
		weapons[] = {"ItemSMGR"};
		requiredAddons[] = {"cba_main_a3"};
	};
};

class CfgWeapons
{
	class Default;
	class ItemCore;

	class ItemSMGR: ItemCore
	{
		scope = 2;
		displayName = "AN/PNC-212 SMGR";
		descriptionUse = "Simple Military GPS Receiver";
		simulation = "ItemGPS";
		picture = "\smgr\data\gear_item_smgr_ca.paa";
		descriptionShort = "Simple Military GPS Receiver";
		class ItemInfo
		{
			mass = 2;
		};
	};
};

class CfgSettings {
	class KeySMGR {
		class SMGR_Key_Settings {
			class keyOpenDlg {
					useActionKey = 1;
					actionKey = "User4";
			};
			class keyOpenHud {
					useActionKey = 1;
					actionKey = "User5";
			};
		};
	};
};


class CfgFunctions
{
	class SMGR
	{
		tag = "SMGR";
		class SMGR
		{
			file = "\smgr\functions";
			class Init{ postInit = 1; };
			class KeyPressed {};
			class arrayRotate {};
			class DataLink {};
			class EditWp {};
			class EditWpSetting {};
			class ErrorMessage {};
			class FormatAngle {};
			class FormatDist {};
			class FormatElevation {};
			class FormatPos {};
			class GetNavData {};
			class GetWpNavData {};
			class GpsPull {};
			class HideAllScreens {};
			class InputBufferAddChar {};
			class InputBufferAddNumber {};
			class Load {};
			class LoadHud {};
			class LoadScreenContext {};
			class mapGridPosition {};
			class MapKeys {};
			class Mark {};
			class OpenCom {};
			class P2PXferReceiveWpList {};
			class P2PXferSendWpList {};
			class PowerOFF {};
			class RefreshWpEdit {};
			class ShowScreen {};
			class SwitchSetting {};
			class SwitchWp {};
			class TacGlasses {};
			class toEditWp {};
			class TrackPos {};
			class DeleteWp {};
			class GpsApplyError {};
		};
	};
};

#include "rsc\RscSmgr.hpp"
#include "rsc\DlgSmgr.hpp"

class RscTitles 
{
	#include "rsc\DlgSmgrHud.hpp"
};