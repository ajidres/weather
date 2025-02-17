class WeatherModel {
  WeatherModel({
      num? latitude, 
      num? longitude, 
      num? generationtimeMs, 
      num? utcOffsetSeconds, 
      String? timezone, 
      String? timezoneAbbreviation, 
      num? elevation, 
      CurrentUnits? currentUnits, 
      Current? current,}){
    _latitude = latitude;
    _longitude = longitude;
    _generationtimeMs = generationtimeMs;
    _utcOffsetSeconds = utcOffsetSeconds;
    _timezone = timezone;
    _timezoneAbbreviation = timezoneAbbreviation;
    _elevation = elevation;
    _currentUnits = currentUnits;
    _current = current;
}

  WeatherModel.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _generationtimeMs = json['generationtime_ms'];
    _utcOffsetSeconds = json['utc_offset_seconds'];
    _timezone = json['timezone'];
    _timezoneAbbreviation = json['timezone_abbreviation'];
    _elevation = json['elevation'];
    _currentUnits = json['current_units'] != null ? CurrentUnits.fromJson(json['current_units']) : null;
    _current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  num? _latitude;
  num? _longitude;
  num? _generationtimeMs;
  num? _utcOffsetSeconds;
  String? _timezone;
  String? _timezoneAbbreviation;
  num? _elevation;
  CurrentUnits? _currentUnits;
  Current? _current;

  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get generationtimeMs => _generationtimeMs;
  num? get utcOffsetSeconds => _utcOffsetSeconds;
  String? get timezone => _timezone;
  String? get timezoneAbbreviation => _timezoneAbbreviation;
  num? get elevation => _elevation;
  CurrentUnits? get currentUnits => _currentUnits;
  Current? get current => _current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['generationtime_ms'] = _generationtimeMs;
    map['utc_offset_seconds'] = _utcOffsetSeconds;
    map['timezone'] = _timezone;
    map['timezone_abbreviation'] = _timezoneAbbreviation;
    map['elevation'] = _elevation;
    if (_currentUnits != null) {
      map['current_units'] = _currentUnits?.toJson();
    }
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    return map;
  }

}

class Current {
  Current({
      String? time, 
      num? interval, 
      num? temperature2m, 
      num? windSpeed10m,}){
    _time = time;
    _interval = interval;
    _temperature2m = temperature2m;
    _windSpeed10m = windSpeed10m;
}

  Current.fromJson(dynamic json) {
    _time = json['time'];
    _interval = json['interval'];
    _temperature2m = json['temperature_2m'];
    _windSpeed10m = json['wind_speed_10m'];
  }
  String? _time;
  num? _interval;
  num? _temperature2m;
  num? _windSpeed10m;

  String? get time => _time;
  num? get interval => _interval;
  num? get temperature2m => _temperature2m;
  num? get windSpeed10m => _windSpeed10m;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['interval'] = _interval;
    map['temperature_2m'] = _temperature2m;
    map['wind_speed_10m'] = _windSpeed10m;
    return map;
  }

}

class CurrentUnits {
  CurrentUnits({
      String? time, 
      String? interval, 
      String? temperature2m, 
      String? windSpeed10m,}){
    _time = time;
    _interval = interval;
    _temperature2m = temperature2m;
    _windSpeed10m = windSpeed10m;
}

  CurrentUnits.fromJson(dynamic json) {
    _time = json['time'];
    _interval = json['interval'];
    _temperature2m = json['temperature_2m'];
    _windSpeed10m = json['wind_speed_10m'];
  }
  String? _time;
  String? _interval;
  String? _temperature2m;
  String? _windSpeed10m;

  String? get time => _time;
  String? get interval => _interval;
  String? get temperature2m => _temperature2m;
  String? get windSpeed10m => _windSpeed10m;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['interval'] = _interval;
    map['temperature_2m'] = _temperature2m;
    map['wind_speed_10m'] = _windSpeed10m;
    return map;
  }

}