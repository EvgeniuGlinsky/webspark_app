class PointDataModel {
  final int x;
  final int y;

  PointDataModel({
    required this.x,
    required this.y,
  });

  factory PointDataModel.fromJson(Map<String, dynamic> json) {
    return PointDataModel(
      x: json['x'] as int,
      y: json['y'] as int,
    );
  }
}
