import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/models/priority.dart';
import 'package:smart_to_do/models/task.dart';
import 'package:smart_to_do/providers/task_provider.dart';
import 'package:smart_to_do/utils/helper.dart';
import 'package:smart_to_do/widgets/date_picker_button_widget.dart';

class AddTaskPage extends StatefulWidget {

  AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  Priority? _selectedValue = Priority.low; // Default value
  DateTime _selectedDateTime = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task+'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(labelText: 'Task Title'),
                  ),
                  TextField(
                    controller: _descController,
                    decoration: InputDecoration(labelText: 'Task Description'),
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Text('Due Date:'),
                      SizedBox(width: 20),
                      Text(Helper().formatDateTime(_selectedDateTime)),
                      Spacer(),
                      DatePickerButton(onDateSelected: (date)=> setState(() => _selectedDateTime = date)),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text('Priority:', style: TextStyle(fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: RadioListTile<Priority>(
                            title: Text('Low'),
                            value: Priority.low,
                            groupValue: _selectedValue,
                            onChanged: (Priority? value) {
                              setState(() => _selectedValue = value);
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<Priority>(
                            title: Text('Medium'),
                            value: Priority.medium,
                            groupValue: _selectedValue,
                            onChanged: (Priority? value) {
                              setState(() => _selectedValue = value);
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<Priority>(
                            title: Text('High'),
                            value: Priority.high,
                            groupValue: _selectedValue,
                            onChanged: (Priority? value) {
                              setState(() => _selectedValue = value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
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
          dueTime: _selectedDateTime,
          title: taskText,
          description: taskDescText,
          isCompleted: false,
          priority: _selectedValue ?? Priority.low,
          creationTime: DateTime.now(),
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
