import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_to_do/pages/add_task_page.dart';
import 'package:smart_to_do/pages/home_page.dart';
import 'package:smart_to_do/providers/task_provider.dart';

void main() {
  runApp(const ToDoApp());
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
