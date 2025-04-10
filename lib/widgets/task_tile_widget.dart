import 'package:flutter/material.dart';
import 'package:smart_to_do/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: task.description != null ? Text(task.description!) : SizedBox(),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) => onChanged(value ?? false),
      ),
    );
  }
}
