#include "controls.hpp"
private [
	"_menuItems"
];

_menuItems = [] call SMGR_fnc_MainMenuControllerGetItems;
[_menuItems] call SMGR_fnc_MainMenuControllerUpdateView;
