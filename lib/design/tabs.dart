import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TabBar Tutorial"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Text("Chats",
                    style: Theme.of(context).textTheme.headline4)),
            Center(
                child: Text("Status",
                    style: Theme.of(context).textTheme.headline4)),
            Center(
                child: Text("Calls",
                    style: Theme.of(context).textTheme.headline4)),
          ],
        ),
      ),
    );
  }
}
