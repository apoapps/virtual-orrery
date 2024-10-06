// solar_system_painter.dart
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:web_orrery/models/planet.dart';

class SolarSystemPainter extends CustomPainter {
  final List<Planet> planets;
  final double animationValue;
  final Function(Planet) onPlanetTapped;
  final Offset? touchPosition;
  final bool planetSelected;
  final Function(Planet) handleSelection;
  final Map<Planet, ui.Image> planetImages;

  SolarSystemPainter(
    this.planets,
    this.animationValue,
    this.onPlanetTapped,
    this.touchPosition,
    this.planetSelected,
    this.handleSelection,
    this.planetImages,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final sunPaint = Paint()..color = Colors.yellow;

    canvas.drawCircle(center, 30, sunPaint);

    const speedMultiplier = 20000.0;

    for (final planet in planets) {
      final orbitRadius = planet.orbitRadius;
      final radius = planet.radius;
      final omega = speedMultiplier * (2 * pi) / planet.orbitalPeriod;
      final angle = animationValue * omega;
      final normalizedAngle = angle % (2 * pi);

      final planetX = center.dx + orbitRadius * cos(normalizedAngle);
      final planetY = center.dy + orbitRadius * sin(normalizedAngle);
      final planetPosition = Offset(planetX, planetY);

      final orbitPaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, orbitRadius, orbitPaint);

      if (planetImages.containsKey(planet)) {
        final image = planetImages[planet]!;
        final srcRect = Rect.fromLTWH(
            0, 0, image.width.toDouble(), image.height.toDouble());
        final dstRect = Rect.fromCenter(
          center: planetPosition,
          width: radius * 2,
          height: radius * 2,
        );
        canvas.drawImageRect(image, srcRect, dstRect, Paint());
      } else {
        final planetPaint = Paint()..color = planet.color;
        canvas.drawCircle(planetPosition, radius, planetPaint);
      }

      final textPainter = TextPainter(
        text: TextSpan(
          text: planet.name,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, planetPosition + Offset(-10, -radius - 10));

      if (touchPosition != null && !planetSelected) {
        if ((touchPosition! - planetPosition).distance < radius) {
          handleSelection(planet);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
