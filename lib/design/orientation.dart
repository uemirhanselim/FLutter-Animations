import 'package:flutter/material.dart';

class OrientaitonView extends StatelessWidget {
  const OrientaitonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orientation Tutorial")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(
                30,
                (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.orange,
                      ),
                    )),
          );
        },
      ),
    );
  }
}
