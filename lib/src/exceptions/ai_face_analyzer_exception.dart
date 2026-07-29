class AiFaceAnalyzerException implements Exception {
  final String code;
  final String message;

  const AiFaceAnalyzerException({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return 'AiFaceAnalyzerException(code: $code, message: $message)';
  }
}