import 'package:banka/datasource/repository/weather_repository_impl.dart';
import 'package:banka/domain/enities/city_entity.dart';
import 'package:banka/domain/enities/weather_entity.dart';
import 'package:banka/domain/repository/weather_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:meta/meta.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit() : super(CitiesInitial());

  final WeatherRepository _weatherRepository = WeatherRepositoryImpl();

  Future<void> getCities(List<CityEntity> countriesFav) async {

    final List<City> countries = await getAllCities();

    var data = countries.map((element) {
      var fav = countriesFav.firstWhere((ec) => ec.name == element.name,
          orElse: () => CityEntity());

      return CityEntity(
          name: element.name,
          favorite: fav.favorite,
          latitude: element.latitude ?? '0',
          longitude: element.longitude ?? '0',
          weather: fav.weather);
    }).toList();

    data.sort((a, b) => a.name.compareTo(b.name));
    
    emit(CitiesHideLoading());

    emit(CitiesResult(data));
  }

  Future<void> favoriteCity(List<CityEntity> countries, String cityCode) async {
    emit(CitiesLoading());

    var country = countries.firstWhere((e) => e.name == cityCode);

    try {
      WeatherEntity response = await _weatherRepository.fetchCityWeather(
          country.longitude, country.latitude);
      emit(CitiesHideLoading());
      country.favorite = !country.favorite;
      country.weather = response;
      var favCountries = countries.where((e) => e.favorite).toList();
      emit(CitiesFavorites(favCountries));

      var weather = [...favCountries];
      weather.sort((a, b) => (a.weather?.temperature2M??0).compareTo((b.weather?.temperature2M??0)));
      emit(CitiesFavoritesWeather(weather));
    } catch (e) {
      emit(CitiesHideLoading());
      emit(CitiesError(e.toString()));
    }
  }

  Future<void> removeFavoriteCity(
      List<CityEntity> countries, String cityCode) async {
    var country = countries.firstWhere((e) => e.name == cityCode);

    country.favorite = !country.favorite;
    var favCountries = countries.where((e) => e.favorite).toList();
    emit(CitiesFavorites(favCountries));
  }
}
