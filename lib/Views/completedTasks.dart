import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';

class CompletedTasks extends StatelessWidget {

  List<Task> completed = [
    new Task("Feed the Cat", "No description needed", "Sunday", "234234"),
    new Task("Buy Pepsi", "No description needed", "Sunday", "234234"),
    new Task("Pay internet Bill", "No description needed", "Sunday", "234234"),
    new Task("Call Uncle Harry", "No description needed", "Sunday", "234234"),
    new Task("Wash your Clothes", "No description needed", "Sunday", "234234"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Completed Tasks"), centerTitle: true, backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: completed.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
                color: Colors.white54, borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              title: Text(
                completed[i].name,
                style: TextStyle(color: Colors.black, fontSize: 18, decoration: TextDecoration.lineThrough),
              ),
            ),
          );
        },
      ),
    );
  }
}
