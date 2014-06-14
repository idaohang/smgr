_wp = _this select 0;

_wpIdx = _wp select 1;
switch true do
{
    case (_wpIdx < 10): {_wpIdx = format ["00%1", _wpIdx];};
    case ((_wpIdx >= 10)and(_wpIdx < 100)): {_wpIdx = format ["0%1", _northings];};
    case ((_wpIdx >= 100)and(_wpIdx < 1000)): {_wpIdx = format ["%1", _northings];};
    default {};
};

_wpIdx;