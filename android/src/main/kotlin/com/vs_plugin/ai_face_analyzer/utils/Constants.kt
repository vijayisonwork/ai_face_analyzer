package com.vs_plugin.ai_face_analyzer.utils

object ChannelConstants {
    const val CHANNEL_NAME = "ai_face_analyzer"
}

object MethodConstants {
    const val INITIALIZE = "initialize"
    const val ANALYZE_IMAGE = "analyzeImage"
    const val DISPOSE = "dispose"
}

object ArgumentConstants {
    const val IMAGE_PATH = "imagePath"
}

object ResultConstants {
    const val FACE_DETECTED = "faceDetected"
    const val FACE_COUNT = "faceCount"
    const val BLUR_SCORE = "blurScore"
    const val BRIGHTNESS = "brightness"
}