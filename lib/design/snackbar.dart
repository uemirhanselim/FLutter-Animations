import 'package:flutter/material.dart';

class SnackBarView extends StatefulWidget {
  const SnackBarView({Key? key}) : super(key: key);
  @override
  State<SnackBarView> createState() => SnackBarViewState();
}

class SnackBarViewState extends State<SnackBarView> {
  void showSnackbar(String title, Color color) {
    SnackBar snackbar = SnackBar(
      content: Text(title),
      backgroundColor: color,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar Tutorial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showSnackbar('Green', Colors.green);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.green),
                ),
                child: const Text("Green")),
            ElevatedButton(
                onPressed: () {
                  showSnackbar('Amber', Colors.amber);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.amber),
                ),
                child: const Text("Amber")),
            ElevatedButton(
                onPressed: () {
                  showSnackbar('Red', Colors.red);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: const Text("red")),
          ],
        ),
      ),
    );
  }
}
