#include "controls.hpp"
#include "constants.hpp"

_buffer = NAMESPACE getVariable ["smgrInputBuffer",""];

["InputBufferController"] call SMGR_fnc_MgmtActivateView;

while {NAMESPACE getVariable ["smgrIsInuputBufferVisible",false]} do {
    [_buffer] call SMGR_fnc_ViewInputBuffer;
};

["InputBufferController"] call SMGR_fnc_MgmtDeactivateView;