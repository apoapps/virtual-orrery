import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:web_orrery/providers/planet_detail_controller.dart';

class PlanetDetailPage extends StatelessWidget {
  const PlanetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    PlanetDetailController planetController =
        Provider.of<PlanetDetailController>(context);
    Planet? planet = planetController.selectedPlanet;

    // If no planet is selected, show an error message
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
          // Background placeholder for the planet details
          Positioned(
            top: 60,
            left: 16,
            child: Text(
              "About ${planet.name}",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Placeholder for the planet on the left
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: planet.color.withOpacity(0.7),
                        child: Text(
                          planet.name.substring(0, 1),
                          style: const TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Information about the planet on the right
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            planet.name,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text('Type: ${planet.type}'),
                          Text('Volume: ${planet.volume} km³'),
                          Text('Density: ${planet.density} g/cm³'),
                          Text('Mass: ${planet.mass} kg'),
                          Text('Orbit Radius: ${planet.orbitRadius} km'),
                          Text('Orbital Period: ${planet.orbitalPeriod} days'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
