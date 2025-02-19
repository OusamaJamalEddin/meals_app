import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromARGB(
        255, 168, 122, 200), //default color if not provided
  });
  final String id;
  final String title;
  final Color color;
}
