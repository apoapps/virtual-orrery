import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';
import 'package:web_orrery/ui/widgets/planet_viewer_3d.dart';
import 'package:web_orrery/ui/widgets/starry_background.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const StarryBackground(),
          const Positioned(
            left: 32,
            top: 0,
            bottom: 0,
            child: SizedBox(
              height: 600,
              width: 600,
              child: PlanetViewer3D(
                enableZoom: false,
                modelPath: "assets/3d/planets/Earth.glb",
              ),
            ),
          ),
          Positioned(
            right: size.width / 6,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Virtual\nOrrery",
                    style: TextStyle(
                      fontSize: 64,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: ActionButton1(
                      text: 'Press to start exploring!',
                      onPressed: () {
                        context.push('/planet_viewer');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
