package com.vs_plugin.ai_face_analyzer.detector

import android.content.Context
import android.net.Uri
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import com.vs_plugin.ai_face_analyzer.model.FaceDetectionResult
import java.io.File

class MlKitFaceDetector(
    private val context: Context
) {

    private val options = FaceDetectorOptions.Builder()
        //.setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_FAST)
        .setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
        .setLandmarkMode(FaceDetectorOptions.LANDMARK_MODE_ALL)
        .setContourMode(FaceDetectorOptions.CONTOUR_MODE_ALL)
        .setClassificationMode(FaceDetectorOptions.CLASSIFICATION_MODE_ALL)
        .build()

    private val detector = FaceDetection.getClient(options)

    fun detectFaces(
        imagePath: String,
        onSuccess: (List<FaceDetectionResult>) -> Unit,
        onFailure: (Exception) -> Unit
    ) {

        val image = InputImage.fromFilePath(
            context,
            Uri.fromFile(File(imagePath))
        )

        detector.process(image)
            .addOnSuccessListener { faces ->

                val results = faces.map {

                    val box = it.boundingBox

                    FaceDetectionResult(
                        left = box.left.toFloat(),
                        top = box.top.toFloat(),
                        right = box.right.toFloat(),
                        bottom = box.bottom.toFloat()
                    )
                }

                onSuccess(results)
            }
            .addOnFailureListener {
                onFailure(it)
            }
    }
}