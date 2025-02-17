import 'package:banka/datasource/model/weather_model.dart';
import 'package:banka/shared/contants.dart';
import 'package:banka/shared/dio_client.dart';
import 'package:dio/dio.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> fetchCityWeather(String long, String lat);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final DioClient dio = DioClient.instance
    ..setDio(
        options: BaseOptions(
      baseUrl: 'https://api.open-meteo.com/v1/',
      responseType: ResponseType.json,
      connectTimeout: Duration(seconds: connectionTime),
      receiveTimeout: Duration(seconds: connectionTime),
    ));

  @override
  Future<WeatherModel> fetchCityWeather(String long, String lat) async {
    try {
      var result = await dio.get(
          'forecast?latitude=$lat&longitude=$long&current=temperature_2m,wind_speed_10m');
      return WeatherModel.fromJson(result.data);
    } catch (e) {
      throw (e as DioException).message ?? 'Error realizando petición';
    }
  }
}
