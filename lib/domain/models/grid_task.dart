import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/point.dart';

class GridTask extends Equatable {
  final Grid grid;
  final Point start;
  final Point end;

  const GridTask({
    required this.grid,
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [
        grid,
        start,
        end,
      ];
}
