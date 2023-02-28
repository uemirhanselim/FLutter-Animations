import 'package:flutter/material.dart';

import 'design/drawer.dart';
import 'design/fonts.dart';
import 'design/snackbar.dart';

class NavigationExampleView extends StatelessWidget {
  NavigationExampleView({super.key});

  // Bunlar Navigate edilecek sayfalar
  final List<Widget> _pages = [
    const DrawerView(),
    const FontView(),
    const SnackBarView(),
  ];

  // Bunlar ListTile üzerinde yazacak title lar
  final List<String> _titles = [
    "Sayfa 1",
    "Sayfa 2",
    "Sayfa 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _listTile(_titles[index], context, _pages[index]);
        },
      ),
    );
  }

  // İstersen bunu widget'ı ayrı bir dosyaya taşıman daha
  // mantıklı olacaktır, mesela widgets adında bir klasör
  // açıp oraya koyabilirsin.  
  Widget _listTile(String text, BuildContext context, Widget screen) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
