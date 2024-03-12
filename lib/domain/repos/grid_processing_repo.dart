import 'package:wedspark_app/data/models/get_grid_list_response.dart';

abstract class GridProcessingRepo {
  Future<GetGridListResponse> getGridTasks(String url);
}
