import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String taskName;
  final bool isComplete;
  final Function(bool?) onchanged;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isComplete,
    required this.onchanged
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.isComplete, 
              onChanged: widget.onchanged,
              activeColor: Colors.black
            ),
            Text(
              widget.taskName,
              style: TextStyle(
                decoration: widget.isComplete ? TextDecoration.lineThrough : TextDecoration.none
              )
            )
          ]
        ),
      ),
    );
  }
}