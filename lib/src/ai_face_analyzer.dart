import 'method_channel/method_channel_client.dart';
import 'models/face_analysis.dart';

class AiFaceAnalyzer {
  AiFaceAnalyzer._();

  static final MethodChannelClient _client = MethodChannelClient();

  static Future<void> initialize() async {
    await _client.initialize();
  }

  static Future<FaceAnalysis> analyzeImage({
    required String imagePath,
  }) {
    return _client.analyzeImage(imagePath);
  }

  static Future<void> dispose() async {
    await _client.dispose();
  }
}