import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';

class MyTasks extends StatefulWidget {
  @override
  _MyTasksState createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  List<Task> tasks = [
    new Task("Feed the Cat", "No description needed", "Sunday", "234234"),
    new Task("Buy Pepsi", "No description needed", "Sunday", "234234"),
    new Task("Pay internet Bill", "No description needed", "Sunday", "234234"),
    new Task("Call Uncle Harry", "No description needed", "Sunday", "234234"),
    new Task("Wash your Clothes", "No description needed", "Sunday", "234234"),
  ];

  List<Task> selected = new List();

  List<bool> checked = new List();

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    if (selected.length == 0) edit = false;
    for (int i =0;i<tasks.length;i++) {
      checked.add(false);
    }
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: tasks.length + 1,
        itemBuilder: (context, i) {
          if ( i == tasks.length )
            return buildAddTaskTile();
          return buildTaskTile(i);
        },
      ),
    );
  }

  Widget buildTaskTile(int i) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        title: Text(
          tasks[i].name,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        trailing: edit
            ? Icon(checked[i]
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked, color: Colors.black,)
            : null,
        onTap: () {
          if (edit) {
            setState(() {
              checked[i] = !checked[i];
              if (checked[i])
                selected.add(tasks[i]);
              else
                selected.remove(tasks[i]);
            });
          }
        },
        onLongPress: () {
          setState(() {
            edit = true;
            checked[i] = !checked[i];
            if (checked[i])
              selected.add(tasks[i]);
            else
              selected.remove(tasks[i]);
          });
        },
      ),
    );
  }

  Widget buildAddTaskTile() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text("Add Task +", style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
