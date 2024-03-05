import 'package:flutter/material.dart';
import 'package:webviewer/services/mywebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Webviewer", textAlign: TextAlign.center,),
        ),
        body: const Center(
          child: Column(
            children: [
              Expanded(child: MyWebView()),
              
            ],
          ),
        )
      ),
    );
  }
}
