import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/models/priority.dart';
import 'package:smart_to_do/models/task.dart';
import 'package:smart_to_do/pages/add_task_page.dart';
import 'package:smart_to_do/pages/home_page.dart';
import 'package:smart_to_do/providers/task_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initDB();

  runApp(const ToDoApp());
}

Future<void> _initDB() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(PriorityAdapter());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Smart TODO+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomePage(),
          '/add-task': (ctx) => AddTaskPage(),
          // Add more routes if needed
        },
      ),
    );
  }
}
