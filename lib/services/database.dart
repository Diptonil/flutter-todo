import 'package:flutter_todo/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Todo {  
  String title;
  bool isComplete;
  DateTime createdOn;

  Todo({
    required this.title,
    this.isComplete = false,
    required this.createdOn
  });
}

class Database {
  final _dataStore = Hive.box(dataStore);
  List<Todo> data = [];

  void fetchData() {
    data = _dataStore.get(dataStoreKey);
  }

  void commitData() {
    _dataStore.put(dataStoreKey, data);
  }

  void createTodo(String title, DateTime dateTime) {
    Todo newTodo = Todo(title: title, createdOn: dateTime);
    data.add(newTodo);
  }

  void updateTodo(int index) {
    data[index].isComplete = !data[index].isComplete;
  }

  void deleteTodo(int index) {
    data.removeAt(index);
  }
}
