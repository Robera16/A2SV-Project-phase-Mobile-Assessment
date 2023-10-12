class Weather {
  final String condition;
  final double temperature;
  final double windSpeed;
  final int humidity;

  Weather({
    required this.condition,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      condition: map['weatherDesc'][0]['value'],
      temperature: double.parse(map['temp_C'].toString()),
      windSpeed: double.parse(map['windspeedKmph'].toString()),
      humidity: int.parse(map['humidity'].toString()),
    );
  }
}
