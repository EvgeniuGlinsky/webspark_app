class GridFormatException implements Exception {
  final String message;

  GridFormatException(this.message);

  @override
  String toString() => 'GridFormatException: $message';
}
