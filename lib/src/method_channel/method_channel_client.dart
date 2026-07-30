import 'package:flutter/services.dart';

import '../constants/argument_constants.dart';
import '../constants/channel_constants.dart';
import '../constants/method_constants.dart';
import '../models/face.dart';
import '../models/face_analysis.dart';

class MethodChannelClient {
  static const MethodChannel _channel =
  MethodChannel(ChannelConstants.channel);

  Future<void> initialize() async {
    await _channel.invokeMethod(MethodConstants.initialize);
  }

  Future<FaceAnalysis> analyzeImage(String imagePath) async {
    final result = await _channel.invokeMethod<List<dynamic>>(
      MethodConstants.analyzeImage,
      {
        ArgumentConstants.imagePath: imagePath,
      },
    );

    final faces = (result ?? [])
        .map(
          (e) => Face.fromMap(
        Map<Object?, Object?>.from(e as Map),
      ),
    )
        .toList();

    return FaceAnalysis.fromFaces(faces);
  }

  Future<void> dispose() async {
    await _channel.invokeMethod(MethodConstants.dispose);
  }
}