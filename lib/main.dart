import 'package:flutter/material.dart';
import 'services/mywebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Column(
        children: [
          Expanded(child: MyWebView()),
        ],
      )),
    );
  }
}
