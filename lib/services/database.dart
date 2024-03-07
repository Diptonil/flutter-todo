import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/services/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  final _dataStore = Hive.box(dataStore);
  List<Todo> data = [];

  void fetchData() {
    List<dynamic> fetchedData = _dataStore.get(dataStoreKey) ?? [];
    print(fetchedData);
    data = fetchedData.map<Todo>((e) => Todo.fromJson(e)).toList();
  }

  void commitData() {
    _dataStore.put(dataStoreKey, data);
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
