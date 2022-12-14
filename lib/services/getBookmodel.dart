import 'package:tutorial/model/BookModel.dart';
import 'package:tutorial/bottompages.dart/Catalogue/BookDetail.dart';
import 'package:tutorial/bottompages.dart/Catalogue/blank.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial/shared/loading.dart';
import 'dart:async';
Future<BookModel> getBook(String bookId) async {
  String url = "https://frigid-fox.herokuapp.com/v1/books/"+bookId+"/";
  var response = await http.get(url,headers: {"Content-Type" : "application/json"},);
  final BookModel bookModel = bookModelFromJson(response.body);
  print(response.body);
  return bookModel;
}

class BookProcess extends StatelessWidget {
  BookProcess({this.bookId});
  final String bookId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBook(bookId),
      builder: (context,AsyncSnapshot<BookModel> snapshot){
        if (snapshot.hasData){
          return BookDetail(book: snapshot.data,);
        }
        else if (snapshot.hasError){
          return Blank(error: snapshot.error.toString(),);
        }
        else{
          return Loading();
        }
      },
    );
  }
}
