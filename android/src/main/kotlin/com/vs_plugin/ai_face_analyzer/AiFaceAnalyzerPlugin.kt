package com.vs_plugin.ai_face_analyzer

import android.content.Context
import com.vs_plugin.ai_face_analyzer.core.FaceAnalyzerManager
import com.vs_plugin.ai_face_analyzer.utils.ChannelConstants
import com.vs_plugin.ai_face_analyzer.utils.MethodConstants
import com.vs_plugin.ai_face_analyzer.utils.ArgumentConstants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AiFaceAnalyzerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private lateinit var manager: FaceAnalyzerManager

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    context = binding.applicationContext

    manager = FaceAnalyzerManager(context)

    channel = MethodChannel(
      binding.binaryMessenger,
      ChannelConstants.CHANNEL_NAME
    )

    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(
    call: MethodCall,
    result: MethodChannel.Result
  ) {

    when (call.method) {

      MethodConstants.INITIALIZE -> {
        result.success(null)
      }

      MethodConstants.ANALYZE_IMAGE -> {

        val arguments = call.arguments<Map<String, Any?>>()

        val imagePath = arguments?.get(ArgumentConstants.IMAGE_PATH) as? String

        if (imagePath == null) {
          result.error(
            "INVALID_ARGUMENT",
            "imagePath is required",
            null
          )
          return
        }

        manager.detectFaces(
          imagePath = imagePath,

          onSuccess = { faces ->

            val response = faces.map {

              mapOf(
                "left" to it.left,
                "top" to it.top,
                "right" to it.right,
                "bottom" to it.bottom
              )
            }

            result.success(response)
          },

          onFailure = {

            result.error(
              "FACE_DETECTION_FAILED",
              it.message,
              null
            )
          }
        )
      }

      MethodConstants.DISPOSE -> {
        result.success(null)
      }

      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}