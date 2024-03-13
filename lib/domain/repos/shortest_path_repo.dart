import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/point.dart';
import 'package:wedspark_app/domain/models/shortest_path.dart';

abstract class ShortestPathRepo {
  ShortestPath? findShortestPath(Grid grid, Point start, Point end);
}
