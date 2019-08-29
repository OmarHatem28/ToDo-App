import 'package:flutter/material.dart';
import '../main.dart';

class CompletedTasks extends StatefulWidget {
  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
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
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  tasks.add(completed[i]);
                  completed.removeAt(i);
                });
              },
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                title: Text(
                  completed[i].name,
                  style: TextStyle(color: Colors.black, fontSize: 18, decoration: TextDecoration.lineThrough),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}