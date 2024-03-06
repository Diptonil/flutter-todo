import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isGreyed;
  final VoidCallback onPressed;

  const Button({super.key, required this.text, required this.isGreyed, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final buttonColour = isGreyed ? Theme.of(context).shadowColor : Theme.of(context).primaryColor;
    
    return MaterialButton(
      color: buttonColour,
      onPressed: onPressed,
      child: Text(text)
    );
  }
}
