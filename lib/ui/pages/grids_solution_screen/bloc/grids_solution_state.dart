import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';

sealed class GridsSolutionState extends Equatable {}

class InitialGridsSolutionState extends GridsSolutionState {
  @override
  List<Object?> get props => [];
}

// This state corresponds to searching shortest paths according to passed tasks
class ResolvingGridsSolutionState extends GridsSolutionState {
  final List<GridSolution> gridSolutions;

  ResolvingGridsSolutionState({
    required this.gridSolutions,
  });

  @override
  List<Object?> get props => [
        gridSolutions,
      ];
}

// This state indicates that all shortest paths are found
class ResolvedGridsSolutionState extends GridsSolutionState {
  final List<GridSolution> gridSolutions;

  ResolvedGridsSolutionState({
    required this.gridSolutions,
  });

  @override
  List<Object?> get props => [
        gridSolutions,
      ];
}

class VerifyingGridsSolutionState extends GridsSolutionState {
  @override
  List<Object?> get props => [];
}

class SuccessVerificationGridsSolutionState extends GridsSolutionState {
  final List<GridSolution> gridSolutions;

  SuccessVerificationGridsSolutionState({
    required this.gridSolutions,
  });

  @override
  List<Object?> get props => [
        gridSolutions,
      ];
}

class ErrorVerificationGridsSolutionState extends GridsSolutionState {
  final Object error;

  ErrorVerificationGridsSolutionState({
    required this.error,
  });

  @override
  List<Object?> get props => [
        error,
      ];
}
