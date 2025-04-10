import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/models/task.dart';
import 'package:smart_to_do/providers/task_provider.dart';

class AddTaskPage extends StatefulWidget {

  AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
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
    final taskDescText = _descController.text;

    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(
          id: DateTime.now().millisecondsSinceEpoch,
          dueTime: DateTime.now(),
          title: taskText,
          description: taskDescText,
          isCompleted: false,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _descController.dispose();
    _taskController.dispose();
    super.dispose();
  }
}
