import 'package:flutter/material.dart';

import 'effects/download_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              headline4: TextStyle(fontWeight: FontWeight.bold))),
      home: const ExampleCupertinoDownloadButton(),
    );
  }
}
