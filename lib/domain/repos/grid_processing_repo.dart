import 'package:wedspark_app/data/models/get_grid_list/get_grid_list_response.dart';
import 'package:wedspark_app/data/models/post_grid_list/post_grid_result.dart';

abstract class GridProcessingRepo {
  Future<GetGridListResponse> getGridTasks(String url);

  Future<void> postGridResults(
    String url,
    List<PostGridResult> results,
  );
}
