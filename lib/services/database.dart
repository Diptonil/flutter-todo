import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database extends ChangeNotifier {
  final _dataStore = Hive.box(dataStore);
  List<Todo> data = [];

  void fetchData() {
    List<dynamic> fetchedData = _dataStore.get(dataStoreKey) ?? [];
    data = List<Todo>.from(fetchedData);
  }

  void commitData() {
    _dataStore.put(dataStoreKey, data);
    notifyListeners();
  }

  void createTodo(String title, DateTime dateTime) {
    Todo newTodo = Todo(title: title, createdOn: dateTime);
    data.add(newTodo);
    commitData();
  }

  void updateTodo(int index) {
    data[index].isComplete = !data[index].isComplete;
    commitData();
  }

  void deleteTodo(int index) {
    data.removeAt(index);
    commitData();
  }

  void deleteAllTodos() {
    data.clear();
    commitData();
  }
}
