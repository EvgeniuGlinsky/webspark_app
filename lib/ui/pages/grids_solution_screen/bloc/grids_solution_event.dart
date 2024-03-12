import 'package:equatable/equatable.dart';

sealed class GridsSolutionEvent extends Equatable {}

class OnLoadGridsSolutionEvent extends GridsSolutionEvent {
  @override
  List<Object?> get props => [];
}
