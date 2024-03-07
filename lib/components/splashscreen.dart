import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_todo/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Icon(
        Icons.note,
        color: Theme.of(context).primaryColor
      ),
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).splashColor,
    );
  }
}
