import 'package:flutter/material.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text with Theme",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.red),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.place),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {}, child: const Text("Button with Theme")),
      ),
    );
  }
}
