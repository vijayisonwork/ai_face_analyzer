import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ai_face_analyzer_platform_interface.dart';

/// An implementation of [AiFaceAnalyzerPlatform] that uses method channels.
class MethodChannelAiFaceAnalyzer extends AiFaceAnalyzerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ai_face_analyzer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
