import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ai_face_analyzer_method_channel.dart';

abstract class AiFaceAnalyzerPlatform extends PlatformInterface {
  /// Constructs a AiFaceAnalyzerPlatform.
  AiFaceAnalyzerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AiFaceAnalyzerPlatform _instance = MethodChannelAiFaceAnalyzer();

  /// The default instance of [AiFaceAnalyzerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAiFaceAnalyzer].
  static AiFaceAnalyzerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AiFaceAnalyzerPlatform] when
  /// they register themselves.
  static set instance(AiFaceAnalyzerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
