import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/models/weather.dart';
import 'package:weather_app/presentation/blocs/weather/weather_bloc.dart';

class CityDetailPage extends StatelessWidget {
  final Weather weather;

  CityDetailPage(this.weather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Weather Detail'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Condition: ${weather.condition}'),
            Text('Temperature: ${weather.temperature}°C'),
            Text('Wind Speed: ${weather.windSpeed} km/h'),
            Text('Humidity: ${weather.humidity}%'),
          ],
        ),
      ),
    );
  }
}
