import 'package:flutter/material.dart';
import 'package:flutter_todo/components/button.dart';

class TodoDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const TodoDialog({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Save", isGreyed: false, onPressed: onSave),
                const SizedBox(width: 8),
                Button(text: "Cancel", isGreyed: true, onPressed: onCancel)
              ]
            )
          ]
        )
      ),
    );
  }
}