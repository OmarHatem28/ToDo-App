import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Color> colors = [
    Colors.redAccent,
    Colors.yellow,
    Colors.blue,
    Colors.deepPurple,
    Colors.green,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: size.height / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("My Tasks"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("My Tasks", style: TextStyle(fontSize: 48),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Flutter App"),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: size.width / 3,
            child: Column(
              children: <Widget>[
                Text("Choose Your Color"),
                Icon(Icons.keyboard_arrow_down, color: Colors.white,)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        height: 50,
        child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: buildColor(colors[i]),
            );
          },
        ),
      ),
    );
  }

  Widget buildColor(Color color) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'myTasks');
      },
      child: Container(
        margin: EdgeInsets.only(left: 8),
        decoration: ShapeDecoration(color: color, shape: CircleBorder()),
        height: 30,
        width: 30,
      ),
    );
  }
}
