import 'package:get_it/get_it.dart';
import 'package:wedspark_app/data/repos/data_processing_repo_impl.dart';
import 'package:wedspark_app/domain/repos/data_processing_repo.dart';
import 'package:wedspark_app/ui/pages/home_screen/bloc/home_screen_bloc.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerFactory<DataProcessingRepo>(() => DataProcessingRepoImpl());
  getIt.registerFactory<HomeScreenBloc>(
    () => HomeScreenBloc(getIt<DataProcessingRepo>()),
  );
}
