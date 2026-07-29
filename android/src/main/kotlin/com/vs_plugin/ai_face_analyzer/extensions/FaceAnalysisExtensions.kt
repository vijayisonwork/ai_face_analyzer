package com.vs_plugin.ai_face_analyzer.extensions

import com.vs_plugin.ai_face_analyzer.model.FaceAnalysis
import com.vs_plugin.ai_face_analyzer.utils.ResultConstants

fun FaceAnalysis.toMap(): Map<String, Any> {

    return mapOf(
        ResultConstants.FACE_DETECTED to faceDetected,
        ResultConstants.FACE_COUNT to faceCount,
        ResultConstants.BLUR_SCORE to blurScore,
        ResultConstants.BRIGHTNESS to brightness,
    )
}