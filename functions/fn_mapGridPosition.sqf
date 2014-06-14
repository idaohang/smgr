_pos = _this select 0;
if(typename _pos == "OBJECT") then {_pos = getpos _pos};

_eastings = round(_pos select 0);
_northings = round(_pos select 1);

switch true do
{
    case (_eastings < 10): {_eastings = format ["0000%1", _eastings];};
    case ((_eastings >= 10)and(_eastings < 100)): {_eastings = format ["000%1", _eastings];};
    case ((_eastings >= 100)and(_eastings < 1000)): {_eastings = format ["00%1", _eastings];};
    case ((_eastings >= 1000)and(_eastings < 10000)): {_eastings = format ["0%1", _eastings];};
    default {};
};
switch true do
{
    case (_northings < 10): {_northings = format ["0000%1", _northings];};
    case ((_northings >= 10)and(_northings < 100)): {_northings = format ["000%1", _northings];};
    case ((_northings >= 100)and(_northings < 1000)): {_northings = format ["00%1", _northings];};
    case ((_northings >= 1000)and(_northings < 10000)): {_northings = format ["0%1", _northings];};
    default {};
};

_grid = format ["%1%2", _eastings, _northings ];
_grid;