import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/point.dart';

class GridPoint extends Equatable implements Comparable<GridPoint> {
  final Point point;
  final bool isAvailable;

  const GridPoint(
    this.point,
    this.isAvailable,
  );

  @override
  List<Object?> get props => [
        point,
        isAvailable,
      ];

  @override
  int compareTo(GridPoint other) {
    if (point.y == other.point.y) {
      return point.x - other.point.x;
    } else {
      return point.y - other.point.y;
    }
  }
}
