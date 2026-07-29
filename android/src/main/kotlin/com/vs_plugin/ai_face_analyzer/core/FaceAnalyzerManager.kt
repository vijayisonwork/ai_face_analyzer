package com.vs_plugin.ai_face_analyzer.core

import com.vs_plugin.ai_face_analyzer.utils.ResultConstants
import com.vs_plugin.ai_face_analyzer.model.FaceAnalysis

class FaceAnalyzerManager(
    context: Context
) {

    private lateinit var tfLite: TensorFlowInterpreter

    fun initialize(): Boolean {
        private val tfLite =
            TensorFlowInterpreter(context)

        tfLite.initialize()

        return true
    }

    fun analyzeImage(imagePath: String): FaceAnalysis {

        check(initialized) {
            "FaceAnalyzerManager has not been initialized."
        }

        return FaceAnalysis(
            faceDetected = true,
            faceCount = 1,
            blurScore = 0.12,
            brightness = 185,
        )
    }

    fun dispose(): Boolean {
        tfLite.close()

        return true
    }
}