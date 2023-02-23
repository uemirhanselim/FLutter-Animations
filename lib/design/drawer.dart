import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);
  @override
  State<DrawerView> createState() => DrawerViewState();
}

class DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drawer Tutorial")),
      body: const Center(child: Text("This is the center")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Code Diaries"),
              accountEmail: const Text("codediaries@gmail.com"),
              currentAccountPicture: ClipOval(
                child: Image.asset("assets/images/logo.png"),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner.png"),
                      fit: BoxFit.cover)),
            ),
            const ListTile(
              title: Text("Account"),
              trailing: Icon(Icons.forward),
            ),
            const ListTile(
              title: Text("Notifications"),
              trailing: Icon(Icons.forward),
            ),
            const ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.forward),
            ),
            const ListTile(
              title: Text("More Info"),
              trailing: Icon(Icons.forward),
            ),
          ],
        ),
      ),
    );
  }
}
