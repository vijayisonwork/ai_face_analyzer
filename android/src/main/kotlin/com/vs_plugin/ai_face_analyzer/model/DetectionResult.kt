package com.vs_plugin.ai_face_analyzer.model

import android.graphics.RectF

data class DetectionResult(

    val boundingBox: RectF,

    val confidence: Float,

    val left: Float,

    val top: Float,

    val right: Float,

    val bottom: Float,
)