import 'package:flutter/material.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/ui/pages/preview_screen/preview_screen_view.dart';

class PreviewScreen extends StatelessWidget {
  final GridSolution gridSolution;

  const PreviewScreen({
    super.key,
    required this.gridSolution,
  });

  @override
  Widget build(BuildContext context) {
    return PreviewScreenView(
      gridSolution: gridSolution,
    );
  }
}
