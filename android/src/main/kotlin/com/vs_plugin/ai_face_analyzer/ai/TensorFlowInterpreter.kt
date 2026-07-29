package com.vs_plugin.ai_face_analyzer.ai

import android.content.Context
import org.tensorflow.lite.Interpreter

class TensorFlowInterpreter(
    private val context: Context
) {

    companion object {
        private const val MODEL_PATH =
            "models/face_detector.tflite"
    }

    private var interpreter: Interpreter? = null

    fun initialize() {

        if (interpreter != null) {
            return
        }

        val modelBuffer =
            ModelLoader(context).loadModel(MODEL_PATH)

        interpreter = Interpreter(
            modelBuffer,
            createOptions()
        )
    }

    fun getInterpreter(): Interpreter {

        return interpreter
            ?: throw IllegalStateException(
                "TensorFlow Lite has not been initialized."
            )
    }

    fun run(
        input: TensorImage,
        outputs: MutableMap<Int, Any>
    ) {

        interpreter!!.runForMultipleInputsOutputs(

            arrayOf(input.buffer),

            outputs
        )
    }

    fun close() {

        interpreter?.close()
        interpreter = null
    }

    private fun createOptions(): Interpreter.Options {

        return Interpreter.Options().apply {

            setNumThreads(4)

            setUseNNAPI(false)

            setCancellable(true)
        }
    }
}