_arr = _this select 0;
_dir  = _this select 1;

_a = [];
{
	[_a, _x] call BIS_fnc_arrayPush;
} forEach _arr;

switch (_dir) do
{
    case "left":
    {
    	[_a, (_a select 0)] call BIS_fnc_arrayPush;
    	[_a] call BIS_fnc_arrayShift;
    };
    case "right":
    {
    	_b = _a;
    	_a = [(_a select ((count _a) - 1))];
    	[_a,_b] call BIS_fnc_arrayPushStack;
    	_a call BIS_fnc_arrayPop;
    };

    default{};
};
_a;