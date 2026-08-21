import 'package:flutter/material.dart';
import '../models/travel_models.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  // Helper to get icons based on condition
  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny': return Icons.wb_sunny_rounded;
      case 'cloudy': return Icons.cloud_rounded;
      case 'rainy': return Icons.grain_rounded;
      case 'storm': return Icons.thunderstorm_rounded;
      case 'humid': return Icons.air_rounded;
      default: return Icons.wb_cloudy_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Occupies entire row
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Current Weather', style: TextStyle(color: Colors.white70)),
                  Text('${weather.temperature}°C', 
                       style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
              Icon(_getWeatherIcon(weather.condition), size: 48, color: Colors.white),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(weather.condition.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 16)),
              Row(
                children: [
                  const Icon(Icons.water_drop, color: Colors.white70, size: 16),
                  Text(' ${weather.humidity}%  ', style: const TextStyle(color: Colors.white70)),
                  const Icon(Icons.air, color: Colors.white70, size: 16),
                  Text(' ${weather.windSpeed} km/h', style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}