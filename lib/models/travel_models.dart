import 'package:flutter/material.dart';

class Weather {
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  const Weather({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  // 1. Converts JSON data from storage back into a Weather object
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      humidity: json['humidity'] as int,
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );
  }

  // 2. Converts this Weather object into a Map for storage
  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'condition': condition,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }
}

class Proponent {
  final String name;
  final String participation;
  final String imagePath;

  Proponent({
    required this.name,
    required this.participation,
    required this.imagePath,
  });
}

class Landmark {
  final String name;
  final String description;
  final List<String> images;

  const Landmark({
    required this.name,
    required this.description,
    this.images = const [],
  });
}

class Dish {
  final String name;
  final String description;
  final String history;
  final String regionOrigin;
  final List<String> images;

  const Dish({
    required this.name,
    required this.description,
    required this.history,
    required this.regionOrigin,
    this.images = const [],
  });
}

class Country {
  final String name;
  final String code;
  final String mapImage;
  final Weather weather;
  final String details;
  // UPDATED: Changed from List<String> to List<Map<String, String>>
  final List<Map<String, String>> internationalAirports;
  final List<Map<String, String>> localAirports;
  final List<String> rules;
  final List<Landmark> landmarks;
  final List<Dish> dishes;

  const Country({
    required this.name,
    required this.code,
    required this.mapImage,
    required this.weather,
    required this.details,
    required this.internationalAirports,
    required this.localAirports,
    required this.rules,
    required this.landmarks,
    required this.dishes,
  });
}