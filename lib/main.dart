import 'package:flutter/material.dart';
import 'package:quizzler/quizPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),)),
      ),
    );
  }
}
