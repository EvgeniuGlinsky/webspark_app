import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/domain/models/shortest_path.dart';
import 'package:wedspark_app/ui/pages/preview_screen/grid_cell.dart';

class PreviewScreenView extends StatelessWidget {
  final GridSolution gridSolution;

  const PreviewScreenView({
    super.key,
    required this.gridSolution,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _Header(),
      body: _Content(
        gridSolution: gridSolution,
      ),
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

class _Content extends StatelessWidget {
  final GridSolution gridSolution;

  const _Content({required this.gridSolution});

  @override
  Widget build(BuildContext context) {
    final columnCount = sqrt(gridSolution.grid.gridPoints.length).round();

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: gridSolution.grid.gridPoints.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount,
          ),
          itemBuilder: (_, index) => GridCell(
            point: gridSolution.grid.gridPoints[index],
            cellKind:
                gridSolution.kindOf(gridSolution.grid.gridPoints[index].point),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          gridSolution.shortestPath?.asReadableTitle ??
              "Grid doesn't have solution",
        ),
      ],
    );
  }
}

extension on ShortestPath {
  String get asReadableTitle =>
      points.map((point) => "(${point.x},${point.y})").join("->");
}
