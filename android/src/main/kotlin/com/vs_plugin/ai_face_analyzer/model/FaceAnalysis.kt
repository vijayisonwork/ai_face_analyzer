package com.vs_plugin.ai_face_analyzer.model

data class FaceAnalysis(
    val faceDetected: Boolean,
    val faceCount: Int,
    val blurScore: Double,
    val brightness: Int,
)