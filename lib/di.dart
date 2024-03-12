import 'package:get_it/get_it.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';
import 'package:wedspark_app/ui/pages/home_screen/domain/repos/home_screen_repo.dart';
import 'package:wedspark_app/ui/pages/home_screen/domain/repos/home_screen_repo_impl.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerFactory<HomeScreenRepo>(() => HomeScreenRepoImpl());
  getIt.registerFactory<HomeScreenBloc>(
    () => HomeScreenBloc(getIt<HomeScreenRepo>()),
  );
}
