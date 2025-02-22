import 'package:flutter/material.dart';

class TabbarImplNew extends StatefulWidget {
  const TabbarImplNew({super.key});

  @override
  State<TabbarImplNew> createState() => _TabbarImplNewState();
}

class _TabbarImplNewState extends State<TabbarImplNew>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBar"),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: "Settings",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Text("Home"),
          ),
          Column(
            children: [
              Text(
                "Hello there",
              ),
              Icon(Icons.abc, size: 20, color: Colors.blue)
            ],
          ),
          Center(
            child: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
