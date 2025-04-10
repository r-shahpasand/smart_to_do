import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/models/task.dart';
import 'package:smart_to_do/providers/task_provider.dart';
import 'package:smart_to_do/utils/helper.dart';
import 'package:smart_to_do/widgets/task_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
      
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('SmartTodo+'),
        actions: [
          IconButton(onPressed: onFilter, icon: Icon(Icons.filter_alt_outlined)),
          IconButton(onPressed: onSort, icon: Icon(Icons.sort)),
        ],
      ),
      body: FutureBuilder(
          future: provider.tasks,
          builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: Text('Loading....'));
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<Task> tasks = snapshot.data!;
                    
                  if (tasks.isEmpty) {
                    return Center(
                      child: Text(
                          'Nothing to show! \n Add new task by pressing + button.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (ctx, index) {
                      final task = tasks[index];

                      return TaskTile(
                        task: task,
                        onChanged: (value) {
                          // Implement task completion logic
                          provider.editContact(task: task.copyWith(isCompleted: value));
                        },
                      );
                    },
                  );
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task').then((_) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ///TODO: implement sorting tasks
  void onSort() => Helper().showSnackBar(context, 'Coming soon...');

  ///TODO: implement filtering tasks
  void onFilter() => Helper().showSnackBar(context, 'Coming soon...');
}
