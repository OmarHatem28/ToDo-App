import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _textController = TextEditingController();

  String name, description, day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildFieldName("Task Name"),
            buildField("Example: Take The Medicine", 1, "TaskName"),
            buildFieldName("Task Description"),
            buildField(
                "I should eat before taking the medicine, and then take the medicine right away",
                5,
                "TaskDescription"),
          ],
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

  Widget buildField(String hint, int maxLines, String which) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _textController,
        autofocus: false,
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
}
