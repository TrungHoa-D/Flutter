import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyWidget());
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamController<int> streamController = StreamController.broadcast();

  Stream? stream;
  int value = 0;

  @override
  void initState() {
    stream = streamController.stream;
    stream?.listen((event) {
      setState(() {
        value = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(value.toString())),
      floatingActionButton: FloatingActionButton(onPressed: () {
        streamController.sink.add(DateTime.now().second);
      }),
    );
  }
}
