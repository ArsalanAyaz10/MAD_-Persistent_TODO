import 'dart:convert';
import 'package:persistent_todo/Models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Taskprovider extends ChangeNotifier {
  List<Taskmodel> _tasks = [];

  List<Taskmodel> get tasks => _tasks;

  Taskprovider() {
    fetchData();
  }

  void addTask(String title, String description, bool status) {
    _tasks.add(
      Taskmodel(
        _tasks.length,
        title: title,
        description: description,
        status: false,
      ),
    );
    storeData();
    notifyListeners();
  }

  void removeTask({required int id}) async {
    _tasks.removeWhere((task) => task.id == id);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedTaskList =
        _tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('tasks', updatedTaskList);
    notifyListeners();
  }

  void toggleTask({required int id}) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex].status = !_tasks[taskIndex].status;
      storeData();
      notifyListeners();
    }
  }

  Future<void> storeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList =
        _tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('tasks', taskList);
  }

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      _tasks =
          taskList.map((task) => Taskmodel.fromJson(jsonDecode(task))).toList();
      notifyListeners();
    }
  }
}
