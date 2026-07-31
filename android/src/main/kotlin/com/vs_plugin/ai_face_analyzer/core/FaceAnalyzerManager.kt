package com.vs_plugin.ai_face_analyzer.core

import android.content.Context
import com.vs_plugin.ai_face_analyzer.detector.MlKitFaceDetector
import com.vs_plugin.ai_face_analyzer.model.FaceDetectionResult

class FaceAnalyzerManager(
    context: Context
) {

    private val detector = MlKitFaceDetector(context)

    fun detectFaces(
        imagePath: String,
        onSuccess: (List<FaceDetectionResult>) -> Unit,
        onFailure: (Exception) -> Unit
    ) {
        detector.detectFaces(
            imagePath = imagePath,
            onSuccess = onSuccess,
            onFailure = onFailure
        )
    }
}