import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:wedspark_app/domain/exceptions/grid_format_exception.dart';
import 'package:wedspark_app/domain/models/grid_point.dart';
import 'package:wedspark_app/domain/models/point.dart';

class Grid extends Equatable {
  static int maxGridSize = 100;

  final String id;
  final List<GridPoint> gridPoints;

  Grid({
    required this.id,
    required List<GridPoint> gridPoints,
  }) : gridPoints = gridPoints.sorted();

  /// Parses a list of string representations of a grid.
  ///
  /// Each string in the input list represents a row in the grid, where:
  /// - A '.' (dot) character represents an available point (`isAvailable` is true).
  /// - An 'X' character represents an unavailable point (`isAvailable` is false).
  ///
  /// The factory creates Grid based on these representations.
  ///
  /// Throws:
  /// - GridFormatException if the input list is empty or contains invalid characters.
  ///
  /// Example:
  /// ```dart
  /// List<String> input = [
  ///   ".X.",
  ///   ".X.",
  ///   "...",
  /// ];
  factory Grid.parse(List<String> input, String id) {
    if (input.isEmpty) {
      throw GridFormatException("Input grid cannot be empty.");
    }

    final List<GridPoint> gridPoints = [];
    for (int y = 0; y < input.length; y++) {
      final row = input[y];

      for (int x = 0; x < row.length; x++) {
        switch (row[x]) {
          case ".":
            gridPoints.add(GridPoint(Point(x, y), true));
          case "X":
            gridPoints.add(GridPoint(Point(x, y), false));
          default:
            throw GridFormatException(
              "Invalid character '${row[x]}' found in input grid at position [$x, $y].",
            );
        }
      }
    }
    return Grid(gridPoints: gridPoints, id: id);
  }

  @override
  List<Object?> get props => [
        gridPoints,
      ];
}
