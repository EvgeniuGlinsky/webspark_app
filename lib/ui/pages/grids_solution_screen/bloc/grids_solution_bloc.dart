import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/domain/repos/shortest_path_repo.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_event.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_state.dart';

class GridsSolutionBloc extends Bloc<GridsSolutionEvent, GridsSolutionState> {
  final ShortestPathRepo _shortestPathRepo;
  final List<GridTask> _gridTasks;

  GridsSolutionBloc(
    this._shortestPathRepo,
    this._gridTasks,
  ) : super(GridsSolutionState());
}
