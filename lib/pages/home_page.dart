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
  final Database database = Database();
  final TextEditingController controller = TextEditingController();

  void saveTask() {
    setState(() {
      database.createTodo(controller.text, DateTime.now());
      controller.clear();
    });
    return Navigator.of(context).pop();
  }

  void modifyCheckBox(bool? value, int index) {
    setState(() {
      database.updateTodo(index);
    });
  }

  void deleteTask(int index) {
    setState(() {
      database.deleteTodo(index);
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
    database.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(database: database),
      body: ListView.builder(
        itemCount: database.data.length,
        itemBuilder: (content, index) {
          return TodoTile(
            taskName: database.data[index].title,
            isComplete: database.data[index].isComplete,
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
