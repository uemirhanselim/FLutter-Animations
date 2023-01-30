import 'package:flutter/material.dart';
import 'package:flutter_animations/page_transition_animation.dart';
import 'package:flutter_animations/physics_simulation.dart';

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
      home: PhysicsSimulationView(),
    );
  }
}
