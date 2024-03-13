import 'package:wedspark_app/data/models/post_grid_list/grid_solution_result_data_model.dart';
import 'package:wedspark_app/data/models/post_grid_list/post_grid_result.dart';
import 'package:wedspark_app/data/models/post_grid_list/step_data_model.dart';
import 'package:wedspark_app/domain/models/grid_solution.dart';

class GridSolutionMapper {
  PostGridResult convertToData(GridSolution gridSolution) {
    final steps = gridSolution.shortestPath?.points ?? [];
    return PostGridResult(
      id: gridSolution.grid.id,
      result: GridSolutionResultDataModel(
        steps: steps
            .map(
              (point) => StepDataModel(
                x: point.x.toString(),
                y: point.y.toString(),
              ),
            )
            .toList(),
        path: steps.map((point) => "(${point.x},${point.y})").join("->"),
      ),
    );
  }
}
