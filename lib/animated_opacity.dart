import 'package:flutter/material.dart';

class AnimatedOpacityView extends StatefulWidget {
  const AnimatedOpacityView({Key? key}) : super(key: key);
  @override
  State<AnimatedOpacityView> createState() => AnimatedOpacityViewState();
}

class AnimatedOpacityViewState extends State<AnimatedOpacityView> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opcaity Example"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        child: const Icon(Icons.flip),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _isVisible ? 1.0 : 0.0,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
