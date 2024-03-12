import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable {}

class OnCountingButtonTapHomeScreenEvent extends HomeScreenEvent {
  final String url;

  OnCountingButtonTapHomeScreenEvent({
    required this.url,
  });

  @override
  List<Object?> get props => [
        url,
      ];
}
