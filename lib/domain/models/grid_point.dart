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
    if (isAvailable != other.isAvailable) {
      return isAvailable ? -1 : 1;
    }

    final diff = point.x - point.y;
    final otherDiff = other.point.x - other.point.y;

    if (diff < otherDiff) {
      return -1;
    } else if (diff > otherDiff) {
      return 1;
    } else {
      return 0;
    }
  }
}
