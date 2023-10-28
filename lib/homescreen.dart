import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final String url = "https://jsonplaceholder.typicode.com/users";
 List<dynamic> data = [];

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
  try {
    var response = await http.get(
      Uri.parse(Uri.encodeFull(url)),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        var convertdatatojson = jsonDecode(response.body);
        data = convertdatatojson;
      });
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
  }

  return "Success";
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "This is http app",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  side: BorderSide(width: 1, color: Colors.black)),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    data[index]["name"].toString(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
