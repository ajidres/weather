class WeatherEntity {
  int temperature2M;
  String temperature2MUnit;
  int windSpeed10m;
  String windSpeed10mUnit;
  String image;

  WeatherEntity(
      {this.temperature2M=0,
      this.temperature2MUnit='',
      this.windSpeed10m=0,
      this.windSpeed10mUnit='',
      this.image=''});
}
