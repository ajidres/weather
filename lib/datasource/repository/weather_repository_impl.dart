import 'package:banka/datasource/mapper/weather_mapper.dart';
import 'package:banka/datasource/remote/weather_data_source.dart';
import 'package:banka/domain/enities/weather_entity.dart';
import 'package:banka/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _weatherDataSource = WeatherDataSourceImpl();

  @override
  Future<WeatherEntity> fetchCityWeather(String long, String lat) async {
    try {
      final result = await _weatherDataSource.fetchCityWeather(long, lat);
      return WeatherMapper.toEntity(result);
    } catch (e) {
      rethrow;
    }
  }
}
