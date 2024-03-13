import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedspark_app/di.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_bloc.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_event.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_state.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/grids_solution_screen_view.dart';

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
      child: BlocListener<GridsSolutionBloc, GridsSolutionState>(
        listenWhen: (_, state) =>
            state is SuccessVerificationGridsSolutionState,
        listener: (context, state) => _onSuccessVerification(
          context,
          (state as SuccessVerificationGridsSolutionState).gridSolutions,
        ),
        child: BlocBuilder<GridsSolutionBloc, GridsSolutionState>(
          builder: (_, state) => GridsSolutionScreenView(
            state: state,
          ),
        ),
      ),
    );
  }

  void _onSuccessVerification(
      BuildContext context, List<GridSolution> gridSolutions) {
    GoRouter.of(context).push(
      "/result_list",
      extra: gridSolutions,
    );
  }
}
