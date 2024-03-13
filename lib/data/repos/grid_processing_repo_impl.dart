import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wedspark_app/data/models/get_grid_list/get_grid_list_response.dart';
import 'package:wedspark_app/data/models/post_grid_list/post_grid_result.dart';
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

  @override
  Future<void> postGridResults(
    String url,
    List<PostGridResult> results,
  ) async {
    final headers = {"Content-Type": "application/json"};
    final body = json.encode(results.map((result) => result.toJson()).toList());

    final httpResponse = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (httpResponse.statusCode != 200) {
      throw HttpException(httpResponse.statusCode.toString());
    }
  }
}
