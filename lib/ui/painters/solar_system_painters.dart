import 'dart:math';
import 'package:flutter/material.dart';
import 'package:web_orrery/models/planet.dart';

class SolarSystemPainter extends CustomPainter {
  final List<Planet> planets;
  final double animationValue;
  final Function(Planet) onPlanetTapped;
  final Offset? touchPosition;
  final bool planetSelected;
  final Function(Planet) handleSelection;

  SolarSystemPainter(
    this.planets,
    this.animationValue,
    this.onPlanetTapped,
    this.touchPosition,
    this.planetSelected,
    this.handleSelection,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final sunPaint = Paint()..color = Colors.yellow;

    canvas.drawCircle(center, 30, sunPaint); // Sol

    for (final planet in planets) {
      final orbitRadius = planet.orbitRadius;
      final radius = planet.radius;

      // Velocidad ajustada por el período orbital real
      final angle = animationValue * (2 * pi / planet.orbitalPeriod);

      final planetX = center.dx + orbitRadius * cos(angle);
      final planetY = center.dy + orbitRadius * sin(angle);
      final planetPosition = Offset(planetX, planetY);

      final orbitPaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(center, orbitRadius, orbitPaint); // Órbita

      final planetPaint = Paint()..color = planet.color;
      canvas.drawCircle(planetPosition, radius, planetPaint);

      // Dibujar el nombre del planeta
      final textPainter = TextPainter(
        text: TextSpan(
          text: planet.name,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, planetPosition + Offset(-10, -radius - 10));

      // Detectar si se hizo clic en el planeta
      if (touchPosition != null && !planetSelected) {
        if ((touchPosition! - planetPosition).distance < radius) {
          handleSelection(planet); // Selecciona el planeta si se toca
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
