import 'package:wedspark_app/data/models/grid_data_model.dart';

class GetGridListResponse {
  final bool error;
  final String message;
  final List<GridDataModel> data;

  GetGridListResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory GetGridListResponse.fromJson(Map<String, dynamic> json) {
    final error = json['error'] as bool;
    final message = json['message'] as String;
    final data = json['data'] as List<dynamic>;

    return GetGridListResponse(
      error: error,
      message: message,
      data: data
          .map((item) => GridDataModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
