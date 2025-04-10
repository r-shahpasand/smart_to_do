import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final String _boxName = "tasksBox";

  // Initialize our list of contacts
  List<Task> _tasks = [];

  // Holds our active task
  Task? _currentTask;

  Future<List<Task>> get tasks async {
    var box = await Hive.openBox<Task>(_boxName);

    // Update our provider state data with a hive read, and refresh the ui
    _tasks = box.values.toList();
    return _tasks;
  }

  /// Add Task
  /// - Saves task data to Hive box persistent storage
  /// - Updates our List with the hive data by read
  /// - Notifies listeners to update the UI, which will be a consumer of the _task List
  void addTask(Task newTask) async {
    var box = await Hive.openBox<Task>(_boxName);

    // Add a task to our box
    await box.add(newTask);

    // Update our provider state data with a hive read, and refresh the ui
    _tasks = box.values.toList();
    notifyListeners();
  }

  /// Delete Task
  void deleteTask(key) async {
    var box = await Hive.openBox<Task>(_boxName);

    await box.delete(key);

    // Update task List with all box values
    _tasks = box.values.toList();

    log("Deleted task with key: $key");

    // Update UI
    notifyListeners();
  }

  /// Edit Task
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  void editContact({required Task task}) async {
    var box = await Hive.openBox<Task>(_boxName);

    // Add a contact to our box
    await box.put(task.id, task);

    // Update List with all box values
    _tasks = box.values.toList();

    _currentTask = box.get(task.id);

    log('New Name Of Contact: ${task.title}');

    // Update UI
    notifyListeners();
  }

  /// Set an active task we can notify listeners for
  void setActiveContact(key) async {
    var box = await Hive.openBox<Task>(_boxName);
    _currentTask = box.get(key);
    notifyListeners();
  }

  /// Get Active tsk
  Task? getActiveContact() {
    return _currentTask;
  }
}