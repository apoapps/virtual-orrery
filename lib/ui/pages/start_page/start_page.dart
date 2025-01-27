import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';
import 'package:web_orrery/ui/widgets/planet_viewer_3d.dart';
import 'package:web_orrery/ui/widgets/starry_background.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/apoapps/virtual-orrery');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const StarryBackground(),
          Positioned(
            right: 32,
            top: 32,
            child: GestureDetector(
              onTap: _launchGitHub,
              child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/2d/icons/github.png'),
              ),
            ),
          ),
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
