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
      isThreeLine: true,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          task.description != null ? Text(task.description!) : SizedBox(),
          Row(
            children: [Text('Priority: '), Text(task.priority.name)],
          )
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Done?'),
          SizedBox(width: 4),
          IconButton(
            onPressed: onChanged(!task.isCompleted),
            icon: Icon(
              task.isCompleted
                  ? Icons.check_box
                  : Icons.cancel_presentation_outlined,
              color: task.isCompleted ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
