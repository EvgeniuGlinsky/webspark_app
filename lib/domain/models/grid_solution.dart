import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/grid_point_kind.dart';
import 'package:wedspark_app/domain/models/point.dart';
import 'package:wedspark_app/domain/models/shortest_path.dart';

class GridSolution extends Equatable {
  final Grid grid;
  final ShortestPath? shortestPath;

  const GridSolution({
    required this.grid,
    required this.shortestPath,
  });

  @override
  List<Object?> get props => [
        grid,
        shortestPath,
      ];
}

extension GridSolutionExtension on GridSolution {
  GridPointKind kindOf(Point point) {
    if (shortestPath != null) {
      if (shortestPath!.points.first == point) {
        return GridPointKind.start;
      }
      if (shortestPath!.points.last == point) {
        return GridPointKind.end;
      }

      if (shortestPath!.points.any((p) => p == point)) {
        return GridPointKind.path;
      }
    }
    final gridPoint = grid.gridPoints.firstWhere((p) => p.point == point);

    return gridPoint.isAvailable
        ? GridPointKind.available
        : GridPointKind.unavailable;
  }
}
