interface FaceDetector {

    fun initialize()

    fun detect(bitmap: Bitmap): List<DetectionResult>

    fun release()

}