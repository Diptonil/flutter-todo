import 'package:flutter/material.dart';
import 'package:flutter_todo/components/appbar.dart';
import 'package:flutter_todo/components/todo_dialog.dart';
import 'package:flutter_todo/components/todo_tile.dart';
import '../services/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Database _database = Database();
  final TextEditingController controller = TextEditingController();

  void saveTask() {
    setState(() {
      _database.createTodo(controller.text, DateTime.now());
      controller.clear();
    });
    return Navigator.of(context).pop();
  }

  void modifyCheckBox(bool? value, int index) {
    setState(() {
      _database.updateTodo(index);
    });
  }

  void deleteTask(int index) {
    setState(() {
      _database.deleteTodo(index);
    });
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
          onSave: saveTask
        );
      }
    );
  }

  @override
  void initState() {
    _database.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: ListView.builder(
        itemCount: _database.data.length,
        itemBuilder: (content, index) {
          return TodoTile(
            taskName: _database.data[index].title,
            isComplete: _database.data[index].isComplete,
            onchanged: (value) => modifyCheckBox(value, index),
            deleteTask: (context) => deleteTask(index),
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
