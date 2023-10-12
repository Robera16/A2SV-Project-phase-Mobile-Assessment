import 'package:bloc/bloc.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        final weather = await repository.getWeatherData(event.city);
        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError("Failed to fetch weather data: $e");
      }
    }
  }
}
