import 'package:get_it/get_it.dart';
import 'package:wedspark_app/data/repos/app_state_repo_impl.dart';
import 'package:wedspark_app/data/repos/grid_processing_repo_impl.dart';
import 'package:wedspark_app/data/repos/shortest_path_repo_impl.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/domain/repos/app_state_repo.dart';
import 'package:wedspark_app/domain/repos/grid_processing_repo.dart';
import 'package:wedspark_app/domain/repos/shortest_path_repo.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grid_solution_mapper.dart';
import 'package:wedspark_app/ui/pages/grids_solution_screen/bloc/grids_solution_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_mapper.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerFactory<GridProcessingRepo>(() => GridProcessingRepoImpl());
  getIt.registerFactory<HomeScreenMapper>(() => HomeScreenMapper());
  getIt.registerFactory<HomeScreenBloc>(
    () => HomeScreenBloc(
      getIt<GridProcessingRepo>(),
      getIt<HomeScreenMapper>(),
      getIt<AppStateRepo>(),
    ),
  );
  getIt.registerFactory<ShortestPathRepo>(() => ShortestPathRepoImpl());
  getIt.registerFactoryParam<GridsSolutionBloc, List<GridTask>, void>(
    (gridTasks, _) => GridsSolutionBloc(
      getIt<ShortestPathRepo>(),
      gridTasks,
      getIt<GridProcessingRepo>(),
      getIt<GridSolutionMapper>(),
      getIt<AppStateRepo>(),
    ),
  );

  getIt.registerFactory<GridSolutionMapper>(() => GridSolutionMapper());

  getIt.registerSingleton<AppStateRepo>(AppStateRepoImpl());
}
