import 'package:weather_app/domain/models/weather.dart';

abstract class IWeatherRepository {
  Future<Weather> getWeatherData(String city);
}
