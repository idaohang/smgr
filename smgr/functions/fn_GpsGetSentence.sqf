private [
	"_pos",
	"_time",
	"_sentence",
	"_error"
];

_time = time;
_pos = getPosASL player;
_error = [getPosASL player] call SMGR_fnc_GpsGetError;

_pos set [0, (_pos select 0) + _error];
_pos set [1, (_pos select 1) + _error];

_sentence = [_time,_pos,_error];

_sentence;