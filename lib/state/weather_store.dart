import 'package:rab_corona_virus_tracker/data/model/weather.dart';
import 'package:rab_corona_virus_tracker/api/weather_repository.dart';

class WeatherStore {
  final WeatherRepository _weatherRepository;

  WeatherStore(this._weatherRepository);

  Weather _weather;

  Weather get weather => _weather;

  void getWeather(String cityName) async {
    _weather = await _weatherRepository.fetchWeather(cityName);
  }
}
