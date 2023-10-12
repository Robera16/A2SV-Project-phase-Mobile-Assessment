import 'package:weather_app/data/data_sources/remote_data_source.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:weather_app/domain/repositories/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherData(String city) async {
    try {
      final data = await remoteDataSource.getWeatherData(city);
      return Weather.fromMap(data);
    } catch (e) {
      // Handle errors (e.g., network issues)
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
