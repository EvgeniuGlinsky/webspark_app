import 'package:equatable/equatable.dart';

sealed class GridsSolutionEvent extends Equatable {}

class OnLoadGridsSolutionEvent extends GridsSolutionEvent {
  @override
  List<Object?> get props => [];
}

class OnSendingResultToServerGridsSolutionEvent extends GridsSolutionEvent {
  @override
  List<Object?> get props => [];
}

class OnSendResultsToServerGridsSolutionEvent extends GridsSolutionEvent {
  @override
  List<Object?> get props => [];
}
