import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_orrery/ui/pages/planet_detail/planet_detail_page.dart';
import 'package:web_orrery/ui/pages/planet_viewer/planet_viewer_page.dart';
import 'package:web_orrery/ui/pages/start_page/start_page.dart';
import 'package:web_orrery/ui/theme/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.darkTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const StartPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return _buildSmartTransition(animation, child);
        },
      ),
    ),
    GoRoute(
      path: '/planet_viewer',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PlanetViewerPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return _buildSmartTransition(animation, child);
        },
      ),
    ),
    GoRoute(
      path: '/planet_detail',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PlanetDetailPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return _buildSmartTransition(animation, child);
        },
      ),
    ),
  ],
);

Widget _buildSmartTransition(Animation<double> animation, Widget child) {
  const curve = Curves.easeInOut;
  final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

  return FadeTransition(
    opacity: curvedAnimation,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1.0).animate(curvedAnimation),
      child: child,
    ),
  );
}
