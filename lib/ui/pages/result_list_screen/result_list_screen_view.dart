import 'package:flutter/material.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/ui/pages/result_list_screen/result_tile.dart';

class ResultListScreenView extends StatelessWidget {
  final List<GridSolution> gridSolutions;
  final ValueChanged<GridSolution> onGridSolutionSelected;

  const ResultListScreenView({
    super.key,
    required this.gridSolutions,
    required this.onGridSolutionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _Header(),
      body: _getContent(),
    );
  }

  Widget _getContent() {
    return ListView.separated(
      itemBuilder: (_, index) => gridSolutions[index].shortestPath != null
          ? ResultTile(
              shortestPath: gridSolutions[index].shortestPath!,
              onTap: () => onGridSolutionSelected(gridSolutions[index]),
            )
          : const Text("Grid doesn't have a shortest path"),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: gridSolutions.length,
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Result List Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF6B8E47),
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.3),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
