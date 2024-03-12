import 'dart:collection';

import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/point.dart';
import 'package:wedspark_app/domain/repos/shortest_path_repo.dart';

class ShortestPathRepoImpl extends ShortestPathRepo {
  @override
  List<Point> findShortestPath(Grid grid, Point start, Point end) {
    final parentMap = <Point, Point?>{};
    final queue = Queue<Point>();
    final visited = <Point>{};

    queue.add(start);
    visited.add(start);
    parentMap[start] = null;

    while (queue.isNotEmpty) {
      final Point current = queue.removeFirst();

      if (current == end) {
        return _reconstructPath(parentMap, start, end);
      }
      const directions = [
        Point(0, 1),
        Point(1, 0),
        Point(0, -1),
        Point(-1, 0),
        Point(1, 1),
        Point(-1, -1),
        Point(1, -1),
        Point(-1, 1),
      ];
      for (final direction in directions) {
        final next = Point(current.x + direction.x, current.y + direction.y);
        if (_isAvailable(grid, next) && !visited.contains(next)) {
          queue.add(next);
          visited.add(next);
          parentMap[next] = current;
        }
      }
    }

    // Return empty list if path not found
    return [];
  }

  bool _isAvailable(Grid grid, Point point) {
    for (final gridPoint in grid.gridPoints) {
      if (gridPoint.point == point) {
        return gridPoint.isAvailable;
      }
    }
    return false;
  }

  List<Point> _reconstructPath(
    Map<Point, Point?> parentMap,
    Point start,
    Point end,
  ) {
    final path = <Point>[];
    Point? current = end;
    while (current != null) {
      path.insert(0, current);
      current = parentMap[current];
    }
    return path;
  }
}
