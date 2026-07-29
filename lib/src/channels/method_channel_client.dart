import 'package:flutter/services.dart';

class MethodChannelClient {
  MethodChannelClient._();

  static const MethodChannel _channel =
  MethodChannel('ai_face_analyzer');

  static Future<bool> initialize() async {
    final bool? initialized =
    await _channel.invokeMethod<bool>('initialize');

    return initialized ?? false;
  }

  static Future<Map<Object?, Object?>> analyzeImage(
      String imagePath,
      ) async {
    final Map<Object?, Object?>? result =
    await _channel.invokeMapMethod<Object?, Object?>(
      'analyzeImage',
      {
        'imagePath': imagePath,
      },
    );

    return result ?? {};
  }

  static Future<bool> dispose() async {
    final bool? disposed =
    await _channel.invokeMethod<bool>('dispose');

    return disposed ?? false;
  }
}