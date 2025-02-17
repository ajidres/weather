import 'package:banka/domain/enities/weather_entity.dart';

class CityEntity {
  String name;
  String latitude;
  String longitude;
  bool favorite;
  WeatherEntity? weather;

  CityEntity(
      {this.name = '',
      this.latitude = '',
      this.longitude = '',
      this.favorite = false,
      this.weather});
}
