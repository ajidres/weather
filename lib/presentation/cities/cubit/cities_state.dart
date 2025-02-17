part of 'cities_cubit.dart';

@immutable
sealed class CitiesState {}

final class CitiesInitial extends CitiesState {}
final class CitiesLoading extends CitiesState {}
final class CitiesHideLoading extends CitiesState {}
final class CitiesResult extends CitiesState {
  final List<CityEntity> cities;
  CitiesResult(this.cities);
}
final class CitiesFavorites extends CitiesState {
  final List<CityEntity> cities;
  CitiesFavorites(this.cities);
}
final class CitiesFavoritesWeather extends CitiesState {
  final List<CityEntity> cities;
  CitiesFavoritesWeather(this.cities);
}
final class CitiesError extends CitiesState {
  final String error;

  CitiesError(this.error);
}



