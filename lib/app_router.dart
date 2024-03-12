import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:wedspark_app/ui/pages/home_screen/home_screen_page.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreenPage(),
    ),
  ],
);
