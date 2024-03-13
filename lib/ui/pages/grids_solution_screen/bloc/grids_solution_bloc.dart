import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/domain/repos/app_state_repo.dart';
import 'package:wedspark_app/domain/repos/grid_processing_repo.dart';
import 'package:wedspark_app/domain/repos/shortest_path_repo.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grid_solution_mapper.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_event.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_state.dart';

class GridsSolutionBloc extends Bloc<GridsSolutionEvent, GridsSolutionState> {
  static final _initialState = InitialGridsSolutionState();

  final ShortestPathRepo _shortestPathRepo;
  final List<GridTask> _gridTasks;
  final GridProcessingRepo _gridProcessingRepo;
  final GridSolutionMapper _mapper;
  final AppStateRepo _appStateRepo;

  GridsSolutionBloc(
    this._shortestPathRepo,
    this._gridTasks,
    this._gridProcessingRepo,
    this._mapper,
    this._appStateRepo,
  ) : super(_initialState) {
    on<GridsSolutionEvent>(
      (event, emit) => switch (event) {
        OnLoadGridsSolutionEvent() => _onLoad(event, emit),
        OnSendResultsToServerGridsSolutionEvent() => _onSendResults(emit),
        OnSendingResultToServerGridsSolutionEvent() => _onSendResults(emit),
      },
    );
  }

  Future<void> _onLoad(
    OnLoadGridsSolutionEvent event,
    Emitter<GridsSolutionState> emit,
  ) async {
    final gridSolutions = <GridSolution>[];
    for (int i = 0; i < _gridTasks.length; i++) {
      final shortestPath = _shortestPathRepo.findShortestPath(
        Grid(
          gridPoints: _gridTasks[i].grid.gridPoints,
          id: _gridTasks[i].grid.id,
        ),
        _gridTasks[i].start,
        _gridTasks[i].end,
      );
      gridSolutions.add(
          GridSolution(grid: _gridTasks[i].grid, shortestPath: shortestPath));
      emit(ResolvingGridsSolutionState(gridSolutions: gridSolutions));
    }

    // I haven't seen more than 2 boards in the server response,
    // So I added a delay to allow the human eye to notice the intermediate screen, as required by the task.

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(
      ResolvedGridsSolutionState(gridSolutions: gridSolutions),
    );
  }

  Future<void> _onSendResults(
    Emitter<GridsSolutionState> emit,
  ) async {
    if (state case ResolvedGridsSolutionState(:final gridSolutions)) {
      final dataModels = gridSolutions
          .map((solution) => _mapper.convertToData(solution))
          .toList();
      try {
        emit(VerifyingGridsSolutionState());

        await _gridProcessingRepo.postGridResults(
          _appStateRepo.userUrl,
          dataModels,
        );

        emit(
          SuccessVerificationGridsSolutionState(gridSolutions: gridSolutions),
        );
        emit(ResolvedGridsSolutionState(gridSolutions: gridSolutions));
      } catch (error) {
        emit(ErrorVerificationGridsSolutionState(error: error));
      }
    }
  }
}
