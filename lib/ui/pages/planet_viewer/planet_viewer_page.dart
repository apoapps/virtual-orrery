import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_orrery/models/planet.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';
import 'package:web_orrery/ui/widgets/solar_system_widget.dart';
import 'package:web_orrery/ui/widgets/starry_background.dart';

class PlanetViewerPage extends StatelessWidget {
  const PlanetViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Planet Viewer')),
      body: Stack(
        children: [
          const StarryBackground(),
          SolarSystemWidget(
            onPlanetSelected: (Planet planet) {
              debugPrint(planet.name);
              context.pop();
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
