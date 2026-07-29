package com.vs_plugin.ai_face_analyzer.ai

import android.content.Context
import java.io.IOException
import java.nio.MappedByteBuffer
import java.nio.channels.FileChannel

class ModelLoader(
    private val context: Context
) {

    @Throws(IOException::class)
    fun loadModel(modelPath: String): MappedByteBuffer {

        val assetFileDescriptor =
            context.assets.openFd(modelPath)

        assetFileDescriptor.use { descriptor ->

            val inputStream =
                descriptor.createInputStream()

            inputStream.use { stream ->

                val channel = stream.channel

                return channel.map(
                    FileChannel.MapMode.READ_ONLY,
                    descriptor.startOffset,
                    descriptor.declaredLength
                )
            }
        }
    }
}