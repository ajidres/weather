import 'package:banka/datasource/model/weather_model.dart';
import 'package:banka/domain/enities/weather_entity.dart';

class WeatherMapper {

  static WeatherEntity toEntity(WeatherModel data) {
    var temp = data.current?.temperature2m?.toInt()??0;
    return WeatherEntity(
      temperature2M: temp,
      temperature2MUnit: data.currentUnits?.temperature2m??'',
        windSpeed10m: data.current?.windSpeed10m?.toInt()??0,
      windSpeed10mUnit: data.currentUnits?.windSpeed10m??'',
      image: temp<0?'assets/ice.jpg':temp>25?'assets/sunny.jpg':'assets/middle.jpg'
    );
  }

}