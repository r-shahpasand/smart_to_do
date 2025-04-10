import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(id: 1, title: 'Shopping', dueTime: DateTime.now(), description: 'Bread and Cheese'),
    Task(id: 2, title: 'Studying', dueTime: DateTime.now().add(Duration(days: 2)), description: 'Study for IELTS')
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

// Implement methods to update and delete tasks

// You can also add methods for fetching and managing tasks
}