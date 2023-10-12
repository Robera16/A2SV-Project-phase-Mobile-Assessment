import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/data_sources/remote_data_source.dart';
import 'package:weather_app/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteDataSource(
        "https://api.worldweatheronline.com/premium/v1/weather.ashx?key={Use one of the api keys}&q={Insert City Name here}&num_of_days=7&tp=3&format=json",
        "42fae4b4a2b54ab09a672402231110");
    final weatherRepository = WeatherRepository(remoteDataSource);

    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository),
        child: HomePage(),
      ),
    );
  }
}
