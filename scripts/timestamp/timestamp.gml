var _year = string(current_year);
var _month = (current_month < 10 ? "0" : "") + string(current_month);
var _day = (current_day < 10 ? "0" : "") + string(current_day);
var _hour = (current_hour < 10 ? "0" : "") + string(current_hour);
var _min = (current_minute < 10 ? "0" : "") + string(current_minute);
var _sec = (current_second < 10 ? "0" : "") + string(current_second);

return "" + _year + "-" + _month + "-" + _day + "T" + _hour + ":" + _min + ":" + _sec;