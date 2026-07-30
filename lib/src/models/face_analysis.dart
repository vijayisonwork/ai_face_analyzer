import 'face.dart';

class FaceAnalysis {
  final bool faceDetected;
  final int faceCount;
  final List<Face> faces;

  const FaceAnalysis({
    required this.faceDetected,
    required this.faceCount,
    required this.faces,
  });

  factory FaceAnalysis.fromFaces(List<Face> faces) {
    return FaceAnalysis(
      faceDetected: faces.isNotEmpty,
      faceCount: faces.length,
      faces: faces,
    );
  }
}