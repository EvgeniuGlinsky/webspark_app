import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/point.dart';

class ShortestPath extends Equatable {
  final List<Point> points;

  const ShortestPath({
    required this.points,
  });

  @override
  List<Object?> get props => [
        points,
      ];
}
