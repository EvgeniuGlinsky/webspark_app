import 'package:wedspark_app/domain/repos/data_processing_repo.dart';

class DataProcessingRepoImpl implements DataProcessingRepo {
  @override
  Future<bool> getIsValidURL(String value) async {
    return false;
  }
}
