import 'package:flutter/material.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TilTok Colne.',
      theme: ThemeData(
        primaryColor: const Color(0xFFff2a55),
      ),
      home: Container(),
    );
  }
}
