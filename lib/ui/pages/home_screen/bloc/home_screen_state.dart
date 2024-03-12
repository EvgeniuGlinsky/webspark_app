import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';

sealed class HomeScreenState extends Equatable {}

class InitialHomeScreenState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class LoadingHomeScreenState extends HomeScreenState {
  LoadingHomeScreenState();

  @override
  List<Object?> get props => [];
}

class SuccessHomeScreenState extends HomeScreenState {
  final List<GridTask> gridTasks;

  SuccessHomeScreenState({
    required this.gridTasks,
  });

  @override
  List<Object?> get props => [
        gridTasks,
      ];
}

class ErrorHomeScreenState extends HomeScreenState {
  final Object error;

  ErrorHomeScreenState({
    required this.error,
  });

  @override
  List<Object?> get props => [
        error,
      ];
}
