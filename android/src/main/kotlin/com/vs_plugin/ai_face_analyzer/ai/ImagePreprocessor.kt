package com.vs_plugin.ai_face_analyzer.ai

import android.graphics.Bitmap
import org.tensorflow.lite.support.image.ImageProcessor
import org.tensorflow.lite.support.image.TensorImage
import org.tensorflow.lite.support.image.ops.ResizeOp
import org.tensorflow.lite.support.common.ops.NormalizeOp

class ImagePreprocessor {

    companion object {

        const val INPUT_WIDTH = 128

        const val INPUT_HEIGHT = 128
    }

    private val processor = ImageProcessor.Builder()

        .add(
            ResizeOp(
                INPUT_HEIGHT,
                INPUT_WIDTH,
                ResizeOp.ResizeMethod.BILINEAR
            )
        )

        .add(
            NormalizeOp(
                127.5f,
                127.5f
            )
        )

        .build()

    fun process(bitmap: Bitmap): TensorImage {

        val tensorImage = TensorImage()

        tensorImage.load(bitmap)

        return processor.process(tensorImage)
    }
}