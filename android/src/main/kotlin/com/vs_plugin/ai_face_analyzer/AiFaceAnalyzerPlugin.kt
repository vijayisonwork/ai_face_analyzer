package com.vs_plugin.ai_face_analyzer

import com.vs_plugin.ai_face_analyzer.channel.MethodDispatcher
import com.vs_plugin.ai_face_analyzer.utils.ChannelConstants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.vs_plugin.ai_face_analyzer.core.FaceAnalyzerManager

class AiFaceAnalyzerPlugin :
  FlutterPlugin,
  MethodCallHandler {

  private lateinit var channel: MethodChannel

  private lateinit var dispatcher: MethodDispatcher

  override fun onAttachedToEngine(
    binding: FlutterPlugin.FlutterPluginBinding
  ) {

    val manager = FaceAnalyzerManager(
      binding.applicationContext
    )

    dispatcher = MethodDispatcher(manager)

    channel = MethodChannel(
      binding.binaryMessenger,
      ChannelConstants.CHANNEL_NAME
    )

    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(
    call: MethodCall,
    result: Result
  ) {

    dispatcher.dispatch(
      call,
      result
    )
  }

  override fun onDetachedFromEngine(
    binding: FlutterPlugin.FlutterPluginBinding
  ) {

    channel.setMethodCallHandler(null)
  }
}