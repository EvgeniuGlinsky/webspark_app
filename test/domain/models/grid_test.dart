import 'package:flutter_test/flutter_test.dart';
import 'package:wedspark_app/domain/models/grid.dart';
import 'package:wedspark_app/domain/models/grid_point.dart';
import 'package:wedspark_app/domain/models/point.dart';

void main() {
  group("Grid.dart", () {
    test("should parse input correctly", () {
      // arrange
      final input = [
        ".X.",
        ".X.",
        "...",
      ];

      // act
      final grid = Grid.parse(input, "7d785c38-cd54-4a98-ab57-44e50ae646c1");

      // assert
      expect(
        grid,
        Grid(
          gridPoints: const [
            GridPoint(Point(0, 0), true),
            GridPoint(Point(0, 1), true),
            GridPoint(Point(0, 2), true),
            GridPoint(Point(1, 0), false),
            GridPoint(Point(1, 1), false),
            GridPoint(Point(1, 2), true),
            GridPoint(Point(2, 0), true),
            GridPoint(Point(2, 1), true),
            GridPoint(Point(2, 2), true),
          ],
          id: "7d785c38-cd54-4a98-ab57-44e50ae646c1",
        ),
      );
    });
  });
}
