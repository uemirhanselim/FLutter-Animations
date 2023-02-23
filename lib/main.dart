import 'package:flutter/material.dart';

import 'animations/animated_opacity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animations',
      home: AnimatedOpacityView(),
    );
  }
}
