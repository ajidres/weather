import 'package:banka/domain/enities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> fetchCityWeather(String long, String lat);
}