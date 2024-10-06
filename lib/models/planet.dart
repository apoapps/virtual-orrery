// planet.dart
import 'dart:ui';

class Planet {
  String name;
  String type;
  double radius;
  double orbitRadius;
  double volume;
  double density;
  double mass;
  double angle = 0.0;
  double orbitalPeriod;
  Color color;
  String? texturePath;

  Planet({
    required this.name,
    required this.type,
    required this.radius,
    required this.orbitRadius,
    required this.volume,
    required this.density,
    required this.mass,
    required this.orbitalPeriod,
    required this.color,
    this.texturePath,
  });
}
