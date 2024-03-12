import 'package:wedspark_app/ui/pages/home_screen/domain/repos/home_screen_repo.dart';

class HomeScreenRepoImpl implements HomeScreenRepo {
  @override
  Future<bool> getIsValidURL(String value) async {
    return false;
  }
}
