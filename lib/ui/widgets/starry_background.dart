import 'dart:math';
import 'package:flutter/material.dart';

class StarryBackground extends StatefulWidget {
  const StarryBackground({super.key});

  @override
  StarryBackgroundState createState() => StarryBackgroundState();
}

class StarryBackgroundState extends State<StarryBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Star> stars;

  @override
  void initState() {
    super.initState();
    final Random random = Random();
    stars = List.generate(
        150,
        (index) => Star(
              x: random.nextDouble(),
              y: random.nextDouble(),
              size: random.nextDouble() * 2.5 + 0.1,
              speed: random.nextDouble() * 0.8 + 0.01,
              twinkle: random.nextBool(),
            ));
    _controller = AnimationController(
      duration: const Duration(
        seconds: 200,
      ),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _StarryPainter(_controller.value, stars),
          child: Container(),
        );
      },
    );
  }
}

class _StarryPainter extends CustomPainter {
  final double animationValue;
  final List<Star> stars;

  _StarryPainter(this.animationValue, this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    const movementRange = 50.0;
    const speedMultiplier = 6.0; // Multiplicador ajustado
    final adjustedAnimationValue = animationValue * speedMultiplier;

    for (final star in stars) {
      final brightness = sin(adjustedAnimationValue * 2 * pi * star.speed);
      final opacity = star.twinkle ? brightness.abs() : 1.0;
      final starX = star.x * size.width +
          sin(adjustedAnimationValue * 2 * pi * star.speed) * movementRange;
      final starY = star.y * size.height +
          cos(adjustedAnimationValue * 2 * pi * star.speed) * movementRange;
      paint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(starX, starY), star.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Star {
  final double x;
  final double y;
  final double size;
  final double speed;
  final bool twinkle;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.twinkle,
  });
}
