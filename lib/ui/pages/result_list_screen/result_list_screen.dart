import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/ui/pages/result_list_screen/result_list_screen_view.dart';

class ResultListScreen extends StatelessWidget {
  final List<GridSolution> gridSolutions;

  const ResultListScreen({
    super.key,
    required this.gridSolutions,
  });

  @override
  Widget build(BuildContext context) {
    return ResultListScreenView(
      gridSolutions: gridSolutions,
      onGridSolutionSelected: (gridSolution) =>
          _onGridSolutionSelected(context, gridSolution),
    );
  }

  void _onGridSolutionSelected(
    BuildContext context,
    GridSolution gridSolution,
  ) {
    GoRouter.of(context).push(
      "/preview",
      extra: gridSolution,
    );
  }
}
