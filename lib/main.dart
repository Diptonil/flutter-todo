import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        shadowColor: Colors.grey,
        scaffoldBackgroundColor: Colors.amber.shade200,
      ),
      home: const HomePage()
    );
  }
}
