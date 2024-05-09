import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PersonProvider())],
      child: MaterialApp(
        home: Scaffold(
          body: Center(
              child: context.watch<PersonProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : null),
        ),
      ),
    );
  }
}
