
import 'ai_face_analyzer_platform_interface.dart';

class AiFaceAnalyzer {
  Future<String?> getPlatformVersion() {
    return AiFaceAnalyzerPlatform.instance.getPlatformVersion();
  }
}
