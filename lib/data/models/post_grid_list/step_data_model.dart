class StepDataModel {
  final String x;
  final String y;

  StepDataModel({
    required this.x,
    required this.y,
  });

  Map<String, dynamic> toJson() {
    return {
      "x": x,
      "y": y,
    };
  }
}
