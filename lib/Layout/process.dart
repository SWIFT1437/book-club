import 'package:flutter/material.dart';
import 'package:tutorial/Layout/HomePage.dart';
import 'package:tutorial/model/DataUser.dart';
import 'package:tutorial/services/GetUser.dart';
import 'package:tutorial/shared/loading.dart';

class Process extends StatelessWidget {
  final String uide;
  Process({this.uide});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DatabaseUser>(future: getUser(uide),
      builder: (context,AsyncSnapshot<DatabaseUser> snapshot){
        if (snapshot.hasData){
          return HomePage(userdata: snapshot.data,);
        }
        else{
          return Loading();
        }
      }
      );
  }
}