// solar_system_widget.dart
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:flutter/services.dart';
import 'package:web_orrery/ui/painters/solar_system_painters.dart';

class SolarSystemWidget extends StatefulWidget {
  final Function(Planet) onPlanetSelected;
  final List<Planet> planets;

  const SolarSystemWidget({
    super.key,
    required this.onPlanetSelected,
    required this.planets,
  });

  @override
  SolarSystemWidgetState createState() => SolarSystemWidgetState();
}

class SolarSystemWidgetState extends State<SolarSystemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset? _touchPosition;
  bool _planetSelected = false;
  Map<Planet, ui.Image> planetImages = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 60),
    )..repeat();

    _loadPlanetImages();
  }

  void _loadPlanetImages() async {
    for (final planet in widget.planets) {
      if (planet.texturePath != null && planet.texturePath!.isNotEmpty) {
        final image = await _loadImage(planet.texturePath!);
        setState(() {
          planetImages[planet] = image;
        });
      }
    }
  }

  Future<ui.Image> _loadImage(String asset) async {
    final data = await rootBundle.load(asset);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  void _handlePlanetSelection(Planet planet) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _planetSelected = true;
      });
      widget.onPlanetSelected(planet);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _touchPosition = details.localPosition;
          _planetSelected = false;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: SolarSystemPainter(
              widget.planets,
              _controller.value,
              widget.onPlanetSelected,
              _touchPosition,
              _planetSelected,
              _handlePlanetSelection,
              planetImages,
            ),
            child: Container(),
          );
        },
      ),
    );
  }
}
