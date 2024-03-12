import 'package:equatable/equatable.dart';

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
  @override
  List<Object?> get props => [];
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
