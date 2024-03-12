import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_event.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';
import 'package:wedspark_app/ui/pages/home_screen/domain/repos/home_screen_repo.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  static final _initialState = InitialHomeScreenState();

  final HomeScreenRepo _homeScreenRepo;

  HomeScreenBloc(this._homeScreenRepo) : super(_initialState) {
    on<HomeScreenEvent>(
      (event, emit) => switch (event) {
        OnCountingButtonTapHomeScreenEvent() => _onNextButtonTap(
            event,
            emit,
          ),
        OnTextFieldValuesIncorrectScreenEvent() => _onTextFieldValuesIncorrect(
            event,
            emit,
          ),
      },
      transformer: sequential(),
    );
  }
}

Future<void> _onNextButtonTap(
  OnCountingButtonTapHomeScreenEvent event,
  Emitter<HomeScreenState> emit,
) async {
  print("Value - ${event.value}");
}

Future<void> _onTextFieldValuesIncorrect(
  OnTextFieldValuesIncorrectScreenEvent event,
  Emitter<HomeScreenState> emit,
) async {}
