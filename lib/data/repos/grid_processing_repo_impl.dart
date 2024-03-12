import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wedspark_app/data/models/get_grid_list_response.dart';
import 'package:wedspark_app/domain/repos/grid_processing_repo.dart';

class GridProcessingRepoImpl implements GridProcessingRepo {
  @override
  Future<GetGridListResponse> getGridTasks(String url) async {
    final httpResponse = await http.get(Uri.parse(url));
    final decodedResponse =
        json.decode(httpResponse.body) as Map<String, dynamic>;
    final response = GetGridListResponse.fromJson(decodedResponse);

    return response;
  }
}
