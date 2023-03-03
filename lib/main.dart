import 'package:flutter/material.dart';

import 'design/theme.dart';

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
          fontFamily: "Tilt Warp",
          appBarTheme: AppBarTheme(color: Colors.purple.shade200),
          textTheme:
              const TextTheme(headline5: TextStyle(color: Colors.purple)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(200, 60)),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.purple.shade200),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))))),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.purple)),
      home: const ThemeView(),
    );
  }
}
