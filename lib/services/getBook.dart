import 'package:flutter/material.dart';
import 'package:tutorial/model/Book.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial/shared/loading.dart';
import 'package:tutorial/model/DataUser.dart';
import 'dart:async';

import 'package:tutorial/bottompages.dart/Catalogue/catalogue.dart';
Future<AllBooks> getBooks() async {
  String url = "http://frigid-fox.herokuapp.com/v1/books/";
  var response = await http.get(url,headers: {"Content-Type" : "application/json"},);
  final AllBooks allBooks = allBooksFromJson(response.body);
  print(response.body);
  return allBooks;
}

class Process extends StatelessWidget {
  final DatabaseUser userdata;
  Process({this.userdata});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBooks(),
      builder: (context,AsyncSnapshot<AllBooks> snapshot){
        if (snapshot.hasData){
          return Catalogue(allBooks: snapshot.data,udata:userdata);
        }
        else{
          return Loading();
        }
      },
    );
  }
}
