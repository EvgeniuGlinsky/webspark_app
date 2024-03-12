import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/domain/repos/data_processing_repo.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_event.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  static final _initialState = InitialHomeScreenState();

  final DataProcessingRepo _homeScreenRepo;

  HomeScreenBloc(this._homeScreenRepo) : super(_initialState) {
    on<HomeScreenEvent>(
      (event, emit) => switch (event) {
        OnCountingButtonTapHomeScreenEvent() => _onCountingButtonTap(
            event,
            emit,
          ),
      },
      transformer: sequential(),
    );
  }

  Future<void> _onCountingButtonTap(
    OnCountingButtonTapHomeScreenEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    print("Value - ${event.url}");
  }
}
