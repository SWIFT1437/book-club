

import 'package:flutter/material.dart';
import 'package:tutorial/model/DataUser.dart';
import 'package:tutorial/services/widget.dart';
import 'package:tutorial/Layout/widgetview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tutorial/services/getBook.dart';
import 'package:tutorial/services/getNotice.dart';


class HomePage extends StatefulWidget {
  final DatabaseUser userdata;
  HomePage({this.userdata});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    DatabaseUser duse = widget.userdata;
   List<Fxn> functions = <Fxn>[
  Fxn('Catalogue', Icons.book,Process(userdata:duse)),
  Fxn('Status', Icons.edit,    Text('Status',              style: TextStyle(color: Colors.grey[900],
              fontSize: 40))),
  Fxn('Notice', Icons.notifications,	ProcessNotice(userdata:duse)),
];
    return Scaffold(
      body:  IndexedStack(
          index: selectedIndex,
          children: functions.map<Widget>((Fxn fxn) {
            return WidgetView(fxn: fxn, data: widget.userdata,);
          }).toList(),
        ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[400],
        items: <Widget/*BottomNavigationBarItem*/>[
          Icon(Icons.book,size:30,color: Colors.white70,),
          Icon(Icons.edit,size:30,color: Colors.white70,),
          Icon(Icons.notifications,size: 30,color: Colors.white70,)
          /*BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('Catalogue',)),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit,), title: Text('Status',)),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications,), title: Text('Notice',)),*/
        ],
        /*current*/index: selectedIndex,
        color: Colors.grey[500],
        height: 50.0,
        animationCurve: Curves.easeInOut,
        buttonBackgroundColor: Colors.grey[900],
        animationDuration: Duration(milliseconds: 600),
        //unselectedItemColor: Colors.grey[800],
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
