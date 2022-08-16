import 'package:flutter/material.dart';
import 'package:tutorial/pages/root.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/services/auth.dart';
import 'package:tutorial/model/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home:Root(),
      ),
    );}}