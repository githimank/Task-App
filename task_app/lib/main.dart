import 'package:flutter/material.dart';
import 'package:task_app/models/tasks.dart';
import 'package:task_app/screens/tasks_screen.dart';

import 'blocs/bloc_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            TasksBloc()..add(AddTask(task: Task(title: "title1"))),
        child: const TasksScreen(),
      ),
    );
  }
}
