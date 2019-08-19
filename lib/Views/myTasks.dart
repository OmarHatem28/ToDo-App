import 'package:flutter/material.dart';
import 'package:todo_app/Models/task.dart';
import 'package:todo_app/Views/addTask.dart';
import 'package:todo_app/Views/completedTasks.dart';

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
  bool grid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < tasks.length; i++) {
      checked.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selected.length == 0) edit = false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: buildAppBar(),
      ),
      body: grid ? buildGridTasks() : buildLinearTasks(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildAppBar() {
    return Container(
      color: Colors.black,
      height: 80,
      padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Text(
              "My Tasks",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 8),
            child: Text("Sunday >"),
          ),
          edit ? IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                edit = false;
                selected.clear();
                for (int i = 0; i < tasks.length; i++) {
                  checked[i] = false;
                }
              });
            },
          ) : IconButton(
            icon: Icon(grid ? Icons.view_list : Icons.grid_on),
            onPressed: () {
              setState(() {
                grid = !grid;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildLinearTasks() {
    return ListView.builder(
      itemCount: tasks.length + 1,
      itemBuilder: (context, i) {
        if (i == tasks.length) return buildAddTaskTile();
        return buildTaskTile(i);
      },
    );
  }

  Widget buildGridTasks() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: tasks.length + 1,
        itemBuilder: (context, i) {
          if (i == tasks.length) return buildAddTaskGrid();
          return buildTaskGrid(i);
        });
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
            ? Icon(
                checked[i]
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: Colors.black,
              )
            : null,
        onTap: () {
          onTap(i);
        },
        onLongPress: () {
          onLongPress(i);
        },
      ),
    );
  }

  Widget buildAddTaskTile() {
    return Opacity(
      opacity: edit ? 0.1 : 1,
      child: Container(
        margin: EdgeInsets.all(20),
        child: InkWell(
          onTap: edit ? null : () => _NavigateForResult(context),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Add Task +",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTaskGrid(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white54,
        child: ListTile(
          onTap: () => onTap(i),
          onLongPress: () => onLongPress(i),
          title: Center(
            child: Text(
              tasks[i].name,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          trailing: edit
              ? Icon(
                  checked[i]
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: Colors.black,
                )
              : null,
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget buildAddTaskGrid() {
    return Opacity(
      opacity: edit ? 0.1 : 1,
      child: Container(
        padding: EdgeInsets.all(12),
        child: InkWell(
          onTap: edit ? null : () => _NavigateForResult(context),
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add Task +",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white54),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return Container(
      color: Colors.black,
      child: GestureDetector(
        child: ListTile(
          title: Container(
            height: 50,
            child: Column(
              children: <Widget>[
                Icon(Icons.keyboard_arrow_up),
                Text(
                  "Done",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
        onVerticalDragStart: (details) {
          Navigator.of(context).push(_createRoute());
        },
      ),
    );
  }

  void onTap(int i) {
    if (edit) {
      setState(() {
        checked[i] = !checked[i];
        if (checked[i])
          selected.add(tasks[i]);
        else
          selected.remove(tasks[i]);
      });
    }
  }

  void onLongPress(int i) {
    setState(() {
      edit = true;
      checked[i] = !checked[i];
      selected.add(tasks[i]);
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CompletedTasks(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.fastOutSlowIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  _NavigateForResult(BuildContext context) async {
    final result = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => AddTask(),
        ));
    if (result != null) {
      setState(() {
        Task newTask = result;
        setState(() {
          tasks.add(newTask);
          checked.add(false);
        });
      });
    }
  }
}
