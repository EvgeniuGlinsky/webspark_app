import 'package:wedspark_app/data/models/point_data_model.dart';

class GridDataModel {
  final String id;
  final List<String> fields;
  final PointDataModel start;
  final PointDataModel end;

  GridDataModel({
    required this.id,
    required this.fields,
    required this.start,
    required this.end,
  });

  factory GridDataModel.fromJson(Map<String, dynamic> json) {
    final fields = List<String>.from(json['field'] as List<dynamic>);
    final start =
        PointDataModel.fromJson(json['start'] as Map<String, dynamic>);
    final end = PointDataModel.fromJson(json['end'] as Map<String, dynamic>);

    return GridDataModel(
      id: json['id'] as String,
      fields: fields,
      start: start,
      end: end,
    );
  }
}
