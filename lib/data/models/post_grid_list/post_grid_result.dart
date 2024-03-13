import 'package:wedspark_app/data/models/post_grid_list/grid_solution_result_data_model.dart';

class PostGridResult {
  final String id;
  final GridSolutionResultDataModel result;

  PostGridResult({
    required this.id,
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "result": result,
    };
  }
}
