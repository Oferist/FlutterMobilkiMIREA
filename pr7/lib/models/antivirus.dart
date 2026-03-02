// lib/models/antivirus.dart
import 'package:flutter/material.dart';

class Antivirus {
  final String name;
  final String description;
  final String shortDescription;
  final String iconUrl;
  final Color color;

  const Antivirus({
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.iconUrl,
    required this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Antivirus &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}