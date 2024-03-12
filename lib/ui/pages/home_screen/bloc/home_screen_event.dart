import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable {}

class OnCountingButtonTapHomeScreenEvent extends HomeScreenEvent {
  final String value;

  OnCountingButtonTapHomeScreenEvent({
    required this.value,
  });

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnTextFieldValuesIncorrectScreenEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}
