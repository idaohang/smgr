_pos = _this select 0;
_elev = _pos select 2;
_error = 0;

switch true do
{
    case ((_elev < -3)and(_elev > -7)):
    {
    	 _error = -10 + random(20);
         missionNamespace setVariable ["smgrPositionError",10];
    };
    case ((_elev < -7)and(_elev > -15)):
    {
    	 _error = -25 + random(50);
         missionNamespace setVariable ["smgrPositionError",25];
    };
    case (_elev < -15):
    {
    	 _error = -100 + random(200);
         missionNamespace setVariable ["smgrPositionError",100];
    };
    default { };
};

_pos set [0, (_pos select 0) + _error];
_pos set [1, (_pos select 1) + _error];

_pos;