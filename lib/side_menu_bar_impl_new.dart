import 'package:flutter/material.dart';

class SideMenuBarImplNew extends StatefulWidget {
  const SideMenuBarImplNew({super.key});

  @override
  State<SideMenuBarImplNew> createState() => _SideMenuBarImplNewState();
}

class _SideMenuBarImplNewState extends State<SideMenuBarImplNew> {
  int selectedIndex = 0;

  final List<Widget> _children = [
    const Center(
      child: Text("Home"),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello there",
        ),
        const Icon(
          Icons.abc,
          size: 20,
          color: Colors.blue,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Username",
          ),
        ),
      ],
    ),
    const Center(
      child: Text("Settings"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SideMenuBar"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  "SideMenuBar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Search"),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _children[selectedIndex],
    );
  }
}
