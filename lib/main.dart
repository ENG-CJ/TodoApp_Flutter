import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/database/todos.dart';
import 'package:todo_app/pages/main_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();

  final box=await Hive.openBox("todo");
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: colors['background-color'],
        appBarTheme:  AppBarTheme(backgroundColor: colors['background-color'])
      ),
      home: const MainApp(),
    );
  }
}

