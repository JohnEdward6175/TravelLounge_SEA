// userProfile/helpData/help_models.dart
import 'package:flutter/material.dart';

class HelpItem {
  final String title;
  final String description;
  final IconData icon;

  HelpItem({
    required this.title, 
    required this.description, 
    required this.icon
  });
}