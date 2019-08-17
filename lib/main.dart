import 'package:flutter/material.dart';
import 'package:todo_app/Views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Task',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}