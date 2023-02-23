import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerAppView extends StatefulWidget {
  const AnimatedContainerAppView({Key? key}) : super(key: key);
  @override
  State<AnimatedContainerAppView> createState() =>
      AnimatedContainerAppViewState();
}

class AnimatedContainerAppViewState extends State<AnimatedContainerAppView> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();

            _height = random.nextInt(300).toDouble();
            _width = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);

            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: AnimatedContainer(
            height: _height,
            width: _width,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
            duration: const Duration(seconds: 1)),
      ),
    );
  }
}
