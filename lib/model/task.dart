import 'dart:collection';

import 'package:flutter/material.dart';

class Tasks extends ChangeNotifier {
  late List<Task> _taskList;

  Tasks() {
    _taskList = [
      Task(taskTitle: 'Todo 1'),
      Task(taskTitle: 'Todo 2'),
      Task(taskTitle: 'Todo 3'),
      Task(taskTitle: 'Todo 4x'),
    ];
  }

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  int get count => _taskList.length;

  void add(Task newTask) {
    _taskList.add(newTask);
    notifyListeners();
  }

  void delete(Task deleteTask) {
    _taskList.remove(deleteTask);
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}

class Task {
  late final String _taskTitle;
  late bool _isDone;

  String get taskTitle => _taskTitle;
  bool get isDone => _isDone;

  Task({required taskTitle, isDone = false}) {
    _taskTitle = taskTitle;
    _isDone = isDone;
  }

  void toggleDone() => _isDone = !_isDone;
}
