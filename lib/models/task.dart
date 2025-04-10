import 'package:smart_to_do/models/priority.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0) // use Hive to generate a type adapter
class Task extends HiveObject{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final DateTime dueTime;

  @HiveField(5)
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