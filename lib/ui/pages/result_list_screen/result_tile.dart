import 'package:flutter/material.dart';
import 'package:wedspark_app/domain/models/shortest_path.dart';

class ResultTile extends StatelessWidget {
  final ShortestPath shortestPath;
  final VoidCallback onTap;

  const ResultTile({
    super.key,
    required this.shortestPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Center(child: Text(shortestPath.readableTitle)),
    );
  }
}

extension on ShortestPath {
  String get readableTitle =>
      points.map((point) => "(${point.x},${point.y})").join("->");
}
