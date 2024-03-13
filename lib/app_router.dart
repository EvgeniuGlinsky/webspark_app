import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/grids_solution_screen.dart';
import 'package:wedspark_app/ui/pages/home_screen/home_screen_page.dart';
import 'package:wedspark_app/ui/pages/preview_screen/preview_screen.dart';
import 'package:wedspark_app/ui/pages/result_list_screen/result_list_screen.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreenPage(),
    ),
    GoRoute(
      path: "/grids_solution",
      builder: (context, state) => GridsSolutionScreen(
        gridTasks: state.extra! as List<GridTask>,
      ),
    ),
    GoRoute(
      path: "/result_list",
      builder: (context, state) => ResultListScreen(
        gridSolutions: state.extra! as List<GridSolution>,
      ),
    ),
    GoRoute(
      path: "/preview",
      builder: (context, state) => PreviewScreen(
        gridSolution: state.extra! as GridSolution,
      ),
    ),
  ],
);
