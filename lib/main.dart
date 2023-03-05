import 'package:flutter/material.dart';

import 'design/tabs.dart';

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
      theme: ThemeData(
          textTheme: const TextTheme(
              headline4: TextStyle(fontWeight: FontWeight.bold))),
      home: const TabsView(),
    );
  }
}
