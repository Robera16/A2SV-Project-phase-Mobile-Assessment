import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String apiKey;
  final String baseUrl;

  RemoteDataSource(this.baseUrl, this.apiKey);

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$apiKey&q=$city&num_of_days=7&tp=3&format=json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['current_condition'][0];
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
