_msf = _this select 0;
_strMsf = "";

_msf = floor(_msf/60);
if (_msf < 1) then {
	_strMsf = "<1min";
} else {
	if (_msf>99) then {
		_strMsf = "OLD";
	} else {
		_strMsf = format ["%1min", _msf];
	};
};

_strMsf;