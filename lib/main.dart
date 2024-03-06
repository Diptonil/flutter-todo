import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(dataStore);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        shadowColor: Colors.grey,
        scaffoldBackgroundColor: Colors.amber.shade200
      ),
      home: const HomePage()
    );
  }
}
