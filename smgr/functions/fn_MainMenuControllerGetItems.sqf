#include "constants.hpp"
private [
	"_mainMenuConfig",
	"_menuItems",
	"_item",
	"_text",
	"_data"
];

_mainMenuConfig = CONFIG_FILE >> "CfgSmgr" >> "MainMenu";

_menuItems = [];

for "_i" from 0 to (count _mainMenuConfig)-1 do
{
	_item = _mainMenuConfig select _i;
	_text = getText(_item >> "text");
	_data = getText(_item >> "data");

	_menuItems set [_i, [_text, _data]];
};

_menuItems;