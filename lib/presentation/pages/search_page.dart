import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/blocs/weather/weather_bloc.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for Cities'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Search input field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Enter a city',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Search button
            ElevatedButton(
              onPressed: () {
                final city = _searchController.text;
                if (city.isNotEmpty) {
                  // Dispatch a GetWeather event to fetch weather data for the entered city.
                  BlocProvider.of<WeatherBloc>(context).add(GetWeather(city));
                }
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
