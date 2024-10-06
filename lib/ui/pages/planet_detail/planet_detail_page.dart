import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:web_orrery/providers/planet_detail_controller.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';
import 'package:web_orrery/ui/widgets/planet_viewer_3d.dart';
import 'package:web_orrery/ui/widgets/starry_background.dart';

class PlanetDetailPage extends StatelessWidget {
  const PlanetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    PlanetDetailController planetController =
        Provider.of<PlanetDetailController>(context);
    Planet? planet = planetController.selectedPlanet;
    if (planet == null) {
      return const Scaffold(
        body: Center(
          child: Text("No planet selected"),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          const StarryBackground(),
          Center(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: PlanetViewer3D(
                          modelPath: "assets/3d/planets/${planet.name}.glb",
                          enableZoom: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                planet.name,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Type: ${planet.type}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Volume: ${planet.volume} km³',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Density: ${planet.density} g/cm³',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Mass: ${planet.mass} kg',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Orbit Radius: ${planet.orbitRadius} km',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Orbital Period: ${planet.orbitalPeriod} days',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
