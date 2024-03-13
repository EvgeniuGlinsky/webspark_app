import 'package:wedspark_app/data/models/get_grid_list/get_grid_list_response.dart';
import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/grid_task.dart';
import 'package:wedspark_app/domain/models/point.dart';

class HomeScreenMapper {
  List<GridTask> convertToDomain(GetGridListResponse response) {
    return response.data
        .map(
          (item) => GridTask(
            grid: Grid.parse(item.fields, item.id),
            start: Point(item.start.x, item.start.y),
            end: Point(item.end.x, item.end.y),
          ),
        )
        .toList();
  }
}
