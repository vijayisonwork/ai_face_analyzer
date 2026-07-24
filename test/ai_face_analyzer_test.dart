import 'package:flutter_test/flutter_test.dart';
import 'package:ai_face_analyzer/ai_face_analyzer.dart';
import 'package:ai_face_analyzer/ai_face_analyzer_platform_interface.dart';
import 'package:ai_face_analyzer/ai_face_analyzer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAiFaceAnalyzerPlatform
    with MockPlatformInterfaceMixin
    implements AiFaceAnalyzerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AiFaceAnalyzerPlatform initialPlatform = AiFaceAnalyzerPlatform.instance;

  test('$MethodChannelAiFaceAnalyzer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAiFaceAnalyzer>());
  });

  test('getPlatformVersion', () async {
    AiFaceAnalyzer aiFaceAnalyzerPlugin = AiFaceAnalyzer();
    MockAiFaceAnalyzerPlatform fakePlatform = MockAiFaceAnalyzerPlatform();
    AiFaceAnalyzerPlatform.instance = fakePlatform;

    expect(await aiFaceAnalyzerPlugin.getPlatformVersion(), '42');
  });
}
