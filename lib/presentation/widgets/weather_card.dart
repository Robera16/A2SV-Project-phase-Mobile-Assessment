import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard(this.weather);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Condition: ${weather.condition}'),
        subtitle: Text('Temperature: ${weather.temperature}°C'),
        onTap: () {
          // Navigate to the city detail page.
        },
      ),
    );
  }
}
