import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/travel_models.dart';

class WeatherService {
  // Replace with your actual OpenWeatherMap API Key
  final String _apiKey = "1c3a656aad842de3701f387da20fe678";

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey&units=metric");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Map the JSON response to your Weather model
      return Weather(
        temperature: (data['main']['temp'] as num).toDouble(),
        condition: data['weather'][0]['main'],
        humidity: data['main']['humidity'],
        windSpeed: (data['wind']['speed'] as num).toDouble(),
      );
    } else {
      throw Exception("Failed to load weather");
    }
  }
}