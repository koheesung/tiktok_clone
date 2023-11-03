import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TilTok Colne',
      theme: ThemeData(
        primaryColor: const Color(0xFFff2a55),
      ),
      home: Padding(
        padding: const EdgeInsets.all(Sizes.size14),
        child: Container(
          child: const Row(children: [
            Text('hello'),
            Gaps.h20,
            Text('hello'),
          ]),
        ),
      ),
    );
  }
}
