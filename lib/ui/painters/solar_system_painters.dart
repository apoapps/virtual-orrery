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

    // Dibujar el sol en el centro
    canvas.drawCircle(center, 30, sunPaint);

    // Multiplicador de velocidad ajustable
    const speedMultiplier =
        400.0; // Puedes ajustar este valor para cambiar la velocidad

    // Dibujar cada planeta
    for (final planet in planets) {
      final orbitRadius = planet.orbitRadius;
      final radius = planet.radius;

      // Calcular la velocidad angular ajustada
      final omega = speedMultiplier * (2 * pi) / planet.orbitalPeriod;

      // Calcular el ángulo basado en la velocidad angular
      final angle = animationValue * omega;

      // Asegurar que el ángulo esté entre 0 y 2π
      final normalizedAngle = angle % (2 * pi);

      // Posición del planeta en su órbita
      final planetX = center.dx + orbitRadius * cos(normalizedAngle);
      final planetY = center.dy + orbitRadius * sin(normalizedAngle);
      final planetPosition = Offset(planetX, planetY);

      // Dibujar la órbita
      final orbitPaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, orbitRadius, orbitPaint);

      // Dibujar el planeta
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
          handleSelection(planet); // Seleccionar el planeta si se toca
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
