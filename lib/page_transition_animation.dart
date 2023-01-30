import 'package:flutter/material.dart';

class PageTransitionAnimationView1 extends StatelessWidget {
  const PageTransitionAnimationView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, _createRoute());
          },
          color: Colors.red,
          child: const Text("Go Route"),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const PageTransitionAnimationView2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1);
      const end = Offset(0, 0);
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final animatedOffset = animation.drive(tween);

      return SlideTransition(position: animatedOffset, child: child);
    },
  );
}

class PageTransitionAnimationView2 extends StatelessWidget {
  const PageTransitionAnimationView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("The Second Page"),
      ),
    );
  }
}
