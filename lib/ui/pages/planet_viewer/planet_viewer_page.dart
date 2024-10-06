// planet_viewer_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:web_orrery/providers/planet_detail_controller.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';
import 'package:web_orrery/ui/widgets/solar_system_widget.dart';
import 'package:web_orrery/ui/widgets/starry_background.dart';

class PlanetViewerPage extends StatelessWidget {
  const PlanetViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Planet> planets = [
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
        texturePath: 'assets/2d/planets/mercury.png',
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
        texturePath: 'assets/2d/planets/venus.png',
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
        texturePath: 'assets/2d/planets/earth.png',
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
        texturePath: 'assets/2d/planets/mars.png',
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
        texturePath: 'assets/2d/planets/jupiter.png',
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
        texturePath: 'assets/2d/planets/saturn.png',
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
        texturePath: 'assets/2d/planets/uranus.png',
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
        texturePath: 'assets/2d/planets/neptune.png',
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          const StarryBackground(),
          SolarSystemWidget(
            planets: planets,
            onPlanetSelected: (Planet newPlanet) {
              Provider.of<PlanetDetailController>(context, listen: false)
                  .setPlanet(newPlanet);

              context.push("/planet_detail");
            },
          ),
          Positioned(
            bottom: 32,
            right: 32,
            child: SizedBox(
              width: 100,
              height: 100,
              child: ActionButton1(
                text: '<--',
                onPressed: () {
                  context.pop('/');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
