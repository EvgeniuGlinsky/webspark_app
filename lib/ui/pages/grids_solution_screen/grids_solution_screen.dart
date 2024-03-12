import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/di.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_bloc.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_event.dart';

class GridsSolutionScreen extends StatelessWidget {
  final List<GridTask> gridTasks;

  const GridsSolutionScreen({
    super.key,
    required this.gridTasks,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridsSolutionBloc>(
      create: (_) => getIt<GridsSolutionBloc>(param1: gridTasks)
        ..add(OnLoadGridsSolutionEvent()),
      child: const Placeholder(),
    );
  }
}
