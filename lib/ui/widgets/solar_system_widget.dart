import 'package:flutter/material.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:web_orrery/ui/painters/solar_system_painters.dart';

class SolarSystemWidget extends StatefulWidget {
  final Function(Planet) onPlanetSelected;

  const SolarSystemWidget({super.key, required this.onPlanetSelected});

  @override
  SolarSystemWidgetState createState() => SolarSystemWidgetState();
}

class SolarSystemWidgetState extends State<SolarSystemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Planet> _planets;
  Offset? _touchPosition;
  bool _planetSelected = false; // Bandera para evitar múltiples selecciones

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    _planets = [
      Planet(
        name: 'Mercury',
        type: 'Planet',
        radius: 5.0,
        orbitRadius: 60.0,
        volume: 6.083e10,
        density: 5.43,
        mass: 3.30e23,
        orbitalPeriod: 88,
        color: Colors.grey,
      ),
      Planet(
        name: 'Venus',
        type: 'Planet',
        radius: 10.0,
        orbitRadius: 90.0,
        volume: 9.28e11,
        density: 5.24,
        mass: 4.87e24,
        orbitalPeriod: 224.7,
        color: Colors.orangeAccent,
      ),
      Planet(
        name: 'Earth',
        type: 'Planet',
        radius: 15.0,
        orbitRadius: 120.0,
        volume: 1.08321e12,
        density: 5.52,
        mass: 5.97e24,
        orbitalPeriod: 365,
        color: Colors.blue,
      ),
      Planet(
        name: 'Mars',
        type: 'Planet',
        radius: 12.0,
        orbitRadius: 150.0,
        volume: 1.63e11,
        density: 3.93,
        mass: 6.39e23,
        orbitalPeriod: 687,
        color: Colors.red,
      ),
      Planet(
        name: 'Jupiter',
        type: 'Planet',
        radius: 25.0,
        orbitRadius: 200.0,
        volume: 1.431e15,
        density: 1.33,
        mass: 1.90e27,
        orbitalPeriod: 4333,
        color: Colors.brown,
      ),
      Planet(
        name: 'Saturn',
        type: 'Planet',
        radius: 22.0,
        orbitRadius: 240.0,
        volume: 8.27e14,
        density: 0.687,
        mass: 5.68e26,
        orbitalPeriod: 10759,
        color: Colors.yellow,
      ),
      Planet(
        name: 'Uranus',
        type: 'Planet',
        radius: 18.0,
        orbitRadius: 280.0,
        volume: 6.83e13,
        density: 1.27,
        mass: 8.68e25,
        orbitalPeriod: 30685,
        color: Colors.lightBlue,
      ),
      Planet(
        name: 'Neptune',
        type: 'Planet',
        radius: 18.0,
        orbitRadius: 320.0,
        volume: 6.25e13,
        density: 1.64,
        mass: 1.02e26,
        orbitalPeriod: 60190,
        color: Colors.blue.shade900,
      ),
    ];
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
          _planetSelected =
              false; // Reinicia la bandera para permitir nuevas selecciones
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: SolarSystemPainter(
              _planets,
              _controller.value,
              widget.onPlanetSelected,
              _touchPosition,
              _planetSelected,
              (Planet planet) {
                if (!_planetSelected) {
                  widget.onPlanetSelected(planet); // Solo se selecciona una vez
                  _planetSelected =
                      true; // Evitar seleccionar múltiples veces hasta que se toque nuevamente
                }
              },
            ),
            child: Container(),
          );
        },
      ),
    );
  }
}
