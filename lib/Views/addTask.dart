import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';
import 'package:todo_app/Views/days.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String name, description, day = "Tab to Choose a day";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildFieldName("Task Name"),
            buildField("Example: Take The Medicine", 1, "TaskName", _nameController),
            buildFieldName("Task Description"),
            buildField(
                "I should eat before taking the medicine, and then take the medicine right away",
                5,
                "TaskDescription", _descController),
            buildFieldName("Task Day"),
            buildSelectDayButton(context),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return Opacity(
      opacity: name == null || description == null ? 0.2 : 1,
      child: Container(
        color: Colors.black,
        child: GestureDetector(
          child: ListTile(
            title: Container(
              padding: EdgeInsets.only(top: 15),
              height: 50,
              child: Text(
                "Add the Task +",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 18),
              ),
            ),
          ),
          onTap: name == null || description == null ? null : () {
            Navigator.pop(context, new Task(name, description, day, "245455"));
          },
        ),
      ),
    );
  }

  Widget buildSelectDayButton(BuildContext context) {
    return FlatButton(
      onPressed: () => _NavigateForResult(context),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.white54, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            day,
            style: TextStyle(color: Colors.black54, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget buildFieldName(String name) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(
        name,
        style: TextStyle(letterSpacing: 1, fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget buildField(String hint, int maxLines, String which, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        autofocus: false,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration.collapsed(
            hintText: hint, hintStyle: TextStyle(color: Colors.black38)),
        maxLines: maxLines,
        onChanged: (text) {
          if (which == "TaskName")
            name = text;
          else
            description = text;
        },
      ),
    );
  }

  _NavigateForResult(BuildContext context) async {
    final String result = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Days(),
        ));
    if (result != null) {
      setState(() {
        day = result;
      });
    }
  }
}
