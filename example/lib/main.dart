import 'package:ai_face_analyzer/ai_face_analyzer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "Not initialized";

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {

    await AiFaceAnalyzer.initialize();

    final analysis = await AiFaceAnalyzer.analyzeImage(
      imagePath: "dummy.jpg",
    );

    setState(() {
      message =  analysis.toString();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Face Analyzer"),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
