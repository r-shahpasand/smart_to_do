
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/providers/task_provider.dart';
import 'package:smart_to_do/widgets/task_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('SmartTodo+'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return TaskTile(
            task: task,
            onChanged: (value) {
              // Implement task completion logic
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add-task'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
