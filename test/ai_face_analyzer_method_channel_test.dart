import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_face_analyzer/ai_face_analyzer_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAiFaceAnalyzer platform = MethodChannelAiFaceAnalyzer();
  const MethodChannel channel = MethodChannel('ai_face_analyzer');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
