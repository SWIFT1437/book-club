import 'package:flutter/material.dart';
import 'package:tutorial/Layout/process.dart';
import 'package:tutorial/model/user.dart';
import 'package:tutorial/pages/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    }
    else {
      if (user.vool){
      return Process(uide: user.uid,);}
      else{
        return Authenticate();
      }
    }
  }
}
