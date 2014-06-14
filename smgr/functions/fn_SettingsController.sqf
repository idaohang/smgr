#include "constants.hpp"
#include "macros.hpp"


// activate controller and view
["SettingsController"] call SMGR_fnc_MgmtAssignKeyActions;
["SettingsController"] call SMGR_fnc_MgmtActivateController;
["SettingsController"] call SMGR_fnc_MgmtActivateView;

_settingsConfig = CONFIG_FILE >> "CfgSmgr" >> "Settings";

while {IsActiveController("SettingsController")} do {

    _menuItems = [];

    for "_i" from 0 to (count _settingsConfig)-1 do
    {
        _text = getText(_settingsConfig select _i >> "text");
        _variable = getText (_settingsConfig select _i >> "variable");
        _currentValue = (NAMESPACE getVariable _variable) select 0;

        _menuItems set [_i,
            [format ["%1 %2", _text,_currentValue], _variable]
        ];
    };

    [_menuItems] call SMGR_fnc_SettingsControllerUpdateView;

};

["SettingsController"] call SMGR_fnc_MgmtDeactivateView;