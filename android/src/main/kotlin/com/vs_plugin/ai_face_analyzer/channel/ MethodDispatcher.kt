package com.vs_plugin.ai_face_analyzer.channel

import com.vs_plugin.ai_face_analyzer.core.FaceAnalyzerManager
import com.vs_plugin.ai_face_analyzer.utils.ArgumentConstants
import com.vs_plugin.ai_face_analyzer.utils.MethodConstants
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import com.vs_plugin.ai_face_analyzer.extensions.toMap

class MethodDispatcher(
    private val manager: FaceAnalyzerManager
) {

    private val manager = FaceAnalyzerManager()

    fun dispatch(
        call: MethodCall,
        result: Result
    ) {

        when (call.method) {

            MethodConstants.INITIALIZE -> {
                result.success(manager.initialize())
            }

            MethodConstants.ANALYZE_IMAGE -> {

                val imagePath =
                    call.argument<String>(ArgumentConstants.IMAGE_PATH)

                if (imagePath == null) {
                    result.error(
                        "INVALID_ARGUMENT",
                        "imagePath is required.",
                        null
                    )
                    return
                }

                result.success(
                    manager.analyzeImage(imagePath) .toMap()
                )
            }

            MethodConstants.DISPOSE -> {
                result.success(manager.dispose())
            }

            else -> {
                result.notImplemented()
            }
        }
    }
}