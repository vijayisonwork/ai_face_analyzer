import 'dart:io';

import 'package:ai_face_analyzer/ai_face_analyzer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Face Analyzer',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  FaceAnalysis? _analysis;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    AiFaceAnalyzer.initialize();
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      final path = result.files.single.path!;

      setState(() {
        _loading = true;
        _image = File(path);
        _analysis = null;
      });

      try {
        final result = await AiFaceAnalyzer.analyzeImage(imagePath: path);

        setState(() {
          _analysis = result;
        });
      } catch (e) {
        debugPrint(e.toString());
      }

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    AiFaceAnalyzer.dispose();
    super.dispose();
  }

  Widget _buildCardItemField(label, value) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(label)),
        Text(":"),
        Expanded(flex: 3, child: Text(" $value")),
      ],
    );
  }

  Widget _buildCardItem(face) {
    return Column(
      children: [
        _buildCardItemField("Left", face.left),
        _buildCardItemField("Top", face.top),
        _buildCardItemField("Right", face.right),
        _buildCardItemField("Bottom", face.bottom),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Face Analyzer")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_analysis == null) ...[
              Center(
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text("Pick Image"),
                ),
              ),

              const SizedBox(height: 5),
            ],

            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

            const SizedBox(height: 10),

            if (_loading) Center(child: const CircularProgressIndicator()),

            if (_analysis != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Face Detected",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Text(":", style: const TextStyle(fontSize: 18)),
                            Expanded(
                              flex: 1,
                              child: Text(
                                " ${_analysis!.faceDetected}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Face Count",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Text(":", style: const TextStyle(fontSize: 18)),
                            Expanded(
                              flex: 1,
                              child: Text(
                                " ${_analysis!.faceCount}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  Center(
                    child: ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text("Pick Image"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: _analysis!.faces.length,
                  itemBuilder: (_, index) {
                    final face = _analysis!.faces[index];

                    return Card(
                      child: ListTile(
                        title: Text("Face ${index + 1}"),
                        subtitle: _buildCardItem(face),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
