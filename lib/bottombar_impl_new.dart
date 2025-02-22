import 'package:flutter/material.dart';

class BottombarImplNew extends StatefulWidget {
  const BottombarImplNew({super.key});

  @override
  State<BottombarImplNew> createState() => _BottombarImplNewState();
}

class _BottombarImplNewState extends State<BottombarImplNew> {
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
      body: _children[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
