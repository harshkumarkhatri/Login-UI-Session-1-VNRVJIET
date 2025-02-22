import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class APIImpl extends StatefulWidget {
  const APIImpl({super.key});

  @override
  State<APIImpl> createState() => _APIImplState();
}

class _APIImplState extends State<APIImpl> {
  Map<String, dynamic> userData = {};
  bool isLoading = false;

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      Client client = Client();

      final url = "https://randomuser.me/api/";
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log("Response is ${response.body}");

        userData = json.decode(response.body);
        // userData = jsonDecode(response.body);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error fetching data."),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API Impl",
        ),
      ),
      body: Column(
        children: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            Column(
              children: [
                Text(
                  "Name: ${userData['results'][0]['name']['first']}",
                ),
                Text(
                  "Name: ${userData['results'][0]['name']['title']}",
                ),
                Image.network(userData['results'][0]['picture']['large'])
              ],
            ),
        ],
      ),
    );
  }
}
