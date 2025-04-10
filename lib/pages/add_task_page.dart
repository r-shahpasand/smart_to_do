import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/models/task.dart';
import 'package:smart_to_do/providers/task_provider.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task+'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addNewTask(context),
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNewTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(
          id: DateTime.now().millisecondsSinceEpoch,
          dueTime: DateTime.now(),
          title: taskText,
          isCompleted: false,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}