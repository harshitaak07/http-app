import 'package:flutter/material.dart';
import 'package:http_app/homescreen.dart';

void main() {
  runApp(const http_app());
}

// ignore: camel_case_types
class http_app extends StatelessWidget {
  const http_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const homescreen(),
    );
  }
}

