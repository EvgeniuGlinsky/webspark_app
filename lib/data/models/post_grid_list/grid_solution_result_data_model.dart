import 'package:wedspark_app/data/models/post_grid_list/step_data_model.dart';

class GridSolutionResultDataModel {
  final List<StepDataModel> steps;
  final String path;

  GridSolutionResultDataModel({
    required this.steps,
    required this.path,
  });

  Map<String, dynamic> toJson() {
    return {
      "steps": steps.map((step) => step.toJson()).toList(),
      "path": path,
    };
  }
}
