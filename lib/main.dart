import 'package:flutter/material.dart';
import 'package:todo_app/Views/addTask.dart';
import 'package:todo_app/Views/home.dart';
import 'package:todo_app/Views/myTasks.dart';

import 'Models/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Task',
      theme: ThemeData.dark(),
      home: Home(),
      routes: {
        'myTasks': (context) => MyTasks(),
        'addTask': (context) => AddTask(),
      },
    );
  }
}

List<Task> tasks = [
  new Task("Feed the Cat", "No description needed", "Sunday", "234234"),
  new Task("Buy Pepsi", "No description needed", "Sunday", "234234"),
  new Task("Pay internet Bill", "No description needed", "Sunday", "234234"),
  new Task("Call Uncle Harry", "No description needed", "Sunday", "234234"),
  new Task("Wash your Clothes", "No description needed", "Sunday", "234234"),
];

List<Task> completed = [
  new Task("Call My Mom", "No description needed", "Sunday", "234234"),
  new Task("Check My Car Engine", "No description needed", "Sunday", "234234"),
];