import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_orrery/ui/widgets/action_button_1.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start Page')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 100,
          child: ActionButton1(
            text: 'Go to Planet Viewer',
            onPressed: () {
              context.push('/planet_viewer');
            },
          ),
        ),
      ),
    );
  }
}
