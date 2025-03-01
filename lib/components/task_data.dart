import 'dart:collection';

import 'package:flutter/material.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.insert(0, task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();

    if (task.isDone) {
      _tasks.remove(task);
      _tasks.add(task);
    } else {
      _tasks.remove(task);
      _tasks.insert(0, task);
    }

    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
