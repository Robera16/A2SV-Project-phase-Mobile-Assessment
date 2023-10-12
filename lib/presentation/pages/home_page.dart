import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/weather_card.dart'; // Import WeatherCard

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return CircularProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    // Display the weather data in a WeatherCard
                    return WeatherCard(
                        state.weather); // WeatherCard is used here
                  } else if (state is WeatherError) {
                    return Text(state.message);
                  } else {
                    return Text('Enter a city to get the weather.');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
