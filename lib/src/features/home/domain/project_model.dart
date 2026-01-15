import 'package:flutter/material.dart';

class Project {
  final String title;
  final String category;
  final String image;
  final Color color;
  final String description;
  final List<String> features;
  final List<String> technologies;

  Project({
    required this.title,
    required this.category,
    required this.image,
    required this.color,
    this.description = '',
    this.features = const [],
    this.technologies = const [],
  });
}
