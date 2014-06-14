/*
    File: FormatDate.sqf
    Author: <G.I.D> Sacha

    Description:
    Gets the date in format 'YY Mon dd HH:mm'

    Parameters:
    none

    Returns:
    Array:
      0: Date (string)
*/

_date = _this select 0;

_year = _date select 0;
_month =  switch (_date select 1) do
{
    case 1: { "Jan" };
    case 2: { "Feb" };
    case 3: { "Mar" };
    case 4: { "Apr" };
    case 5: { "May" };
    case 6: { "Jun" };
    case 7: { "Jul" };
    case 8: { "Aug" };
    case 9: { "Sep" };
    case 10: { "Oct" };
    case 11: { "Nov" };
    case 12: { "Dec" };
    default {};
};
_day = _date select 2;
_hours = _date select 3;
if (_hours < 10) then { _hours = "0" + (str _hours); };
_minutes = _date select 4;
if (_minutes < 10) then { _minutes = "0" + (str _minutes); };

_date = format ["%1 %2 %3 %4:%5", _year, _month, _day, _hours, _minutes];

_date;