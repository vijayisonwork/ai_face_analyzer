class AiFaceAnalysis {
  final bool faceDetected;
  final int faceCount;
  final double blurScore;
  final int brightness;

  const AiFaceAnalysis({
    required this.faceDetected,
    required this.faceCount,
    required this.blurScore,
    required this.brightness,
  });

  factory AiFaceAnalysis.fromMap(Map<Object?, Object?> map) {
    return AiFaceAnalysis(
      faceDetected: map['faceDetected'] as bool? ?? false,
      faceCount: map['faceCount'] as int? ?? 0,
      blurScore: (map['blurScore'] as num?)?.toDouble() ?? 0.0,
      brightness: map['brightness'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'faceDetected': faceDetected,
      'faceCount': faceCount,
      'blurScore': blurScore,
      'brightness': brightness,
    };
  }

  @override
  String toString() {
    return 'AiFaceAnalysis('
        'faceDetected: $faceDetected, '
        'faceCount: $faceCount, '
        'blurScore: $blurScore, '
        'brightness: $brightness'
        ')';
  }
}