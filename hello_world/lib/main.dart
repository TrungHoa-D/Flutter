import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          const Text(
            "Flutter layout demo",
            style: TextStyle(fontSize: 24),
          ),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ_-bktMdUaFKYwppGlDQTeqTQI9aUPrwd5w&usqp=CAU',
            width: screenWidth,
            fit: BoxFit.fitWidth,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Something",
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ],
          )
        ],
      )),
    );
  }
}
