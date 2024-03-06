import 'package:flutter/material.dart';
import 'package:flutter_todo/components/todo_dialog.dart';
import 'package:flutter_todo/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos = [
    ["first", true],
    ["second", false]
  ];
  final TextEditingController controller = TextEditingController();

  void modifyCheckBox(bool? value, int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todos.add([controller.text, false]);
    });
    return Navigator.of(context).pop();
  }

  void cancelSave() {
    return Navigator.of(context).pop();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TodoDialog(
          controller: controller,
          onCancel: cancelSave,
          onSave: saveTask,);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: const Icon(Icons.menu)
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (content, index) {
          return TodoTile(
            taskName: todos[index][0],
            isComplete: todos[index][1],
            onchanged: (value) => modifyCheckBox(value, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add)
      ),
    );
  }
}
