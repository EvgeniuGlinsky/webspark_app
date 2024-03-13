import 'package:flutter/material.dart';
import 'package:wedspark_app/domain/models/grid_point.dart';
import 'package:wedspark_app/domain/models/grid_point_kind.dart';

class GridCell extends StatelessWidget {
  final GridPointKind cellKind;
  final GridPoint point;

  const GridCell({
    super.key,
    required this.cellKind,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        color: _getColor(),
      ),
      child: Center(
        child: Text(
          point.asReadableTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Color _getColor() {
    return switch (cellKind) {
      GridPointKind.start => const Color(0xFF64FFDA),
      GridPointKind.path => const Color(0xFF4CAF50),
      GridPointKind.end => const Color(0xFF009688),
      GridPointKind.available => const Color(0xFFFFFFFF),
      GridPointKind.unavailable => const Color(0xAA000000),
    };
  }
}

extension on GridPoint {
  String get asReadableTitle => "(${point.x},${point.y})";
}
