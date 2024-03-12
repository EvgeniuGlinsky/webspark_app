import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/point.dart';

abstract class ShortestPathRepo {
  List<Point> findShortestPath(Grid grid, Point start, Point end);
}
