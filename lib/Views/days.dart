import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {

  List<String> days = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tueday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];

  List<bool> selected = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < days.length; i++) {
      selected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: i == days.length - 1 ? 20 : 0),
            decoration: BoxDecoration(
                color: selected[i] ? Colors.white : Colors.white54,
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              title: Text(
                days[i],
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                setState(() {
                  selected[i] = true;
                  for ( int j=0;j<days.length;j++) {
                    if ( j == i ) continue;
                    selected[j] = false;
                  }
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: GestureDetector(
          child: ListTile(
            title: Container(
              padding: EdgeInsets.only(top: 15),
              height: 50,
              child: Text(
                "Done",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              ),
            ),
          ),
          onTap: () {
            int checked = 0;
            for ( int i=0;i<days.length;i++) {
              if ( selected[i] ) checked = i;
            }
            Navigator.pop(context, days[checked]);
          },
        ),
      ),
    );
  }
}
