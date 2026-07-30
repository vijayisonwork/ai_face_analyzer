class Face {
  final double left;
  final double top;
  final double right;
  final double bottom;

  const Face({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  factory Face.fromMap(Map<Object?, Object?> map) {
    return Face(
      left: (map['left'] as num).toDouble(),
      top: (map['top'] as num).toDouble(),
      right: (map['right'] as num).toDouble(),
      bottom: (map['bottom'] as num).toDouble(),
    );
  }
}