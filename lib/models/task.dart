import 'package:smart_to_do/models/priority.dart';

class Task {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime dueTime;
  final Priority priority;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.description,
    this.priority = Priority.high,
    required this.dueTime,
  });
}