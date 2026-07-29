import '../channels/method_channel_client.dart';
import '../exceptions/ai_face_analyzer_exception.dart';
import '../models/ai_face_analysis.dart';

class AiFaceAnalyzer {
  AiFaceAnalyzer._();

  static Future<void> initialize() async {
    final bool success = await MethodChannelClient.initialize();

    if (!success) {
      throw const AiFaceAnalyzerException(
        code: 'INITIALIZATION_FAILED',
        message: 'Unable to initialize AI Face Analyzer.',
      );
    }
  }

  static Future<AiFaceAnalysis> analyzeImage({
    required String imagePath,
  }) async {
    final result =
    await MethodChannelClient.analyzeImage(imagePath);

    return AiFaceAnalysis.fromMap(result);
  }

  static Future<void> dispose() async {
    final bool success = await MethodChannelClient.dispose();

    if (!success) {
      throw const AiFaceAnalyzerException(
        code: 'DISPOSE_FAILED',
        message: 'Unable to dispose AI Face Analyzer.',
      );
    }
  }
}