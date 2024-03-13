import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedspark_app/domain/repos/app_state_repo.dart';
import 'package:wedspark_app/domain/repos/grid_processing_repo.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_event.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_mapper.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  static final _initialState = InitialHomeScreenState();

  final GridProcessingRepo _gridProcessingRepo;
  final HomeScreenMapper _mapper;
  final AppStateRepo _appStateRepo;

  HomeScreenBloc(
    this._gridProcessingRepo,
    this._mapper,
    this._appStateRepo,
  ) : super(_initialState) {
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
    try {
      final result = await _gridProcessingRepo.getGridTasks(event.url);
      final gridTasks = _mapper.convertToDomain(result);

      _appStateRepo.userUrl = event.url;
      emit(SuccessHomeScreenState(gridTasks: gridTasks));
    } catch (error) {
      emit(ErrorHomeScreenState(error: error));
    }
  }
}
