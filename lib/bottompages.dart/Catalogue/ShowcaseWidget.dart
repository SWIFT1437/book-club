import 'package:tutorial/services/getBookmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/model/Book.dart';
import 'dart:math' as math;
class ShowcaseWidget extends StatelessWidget {
  final Book book;
  ShowcaseWidget({this.book});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Card(
              shadowColor: Colors.black,
              elevation: 24,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child:  ClipRRect(
                borderRadius:BorderRadius.circular(10) ,
                  child: getImage(book.cover.large),
             ),
            ),
            Positioned.fill(child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color:getType(book.cover.large)?Colors.transparent:Color((math.Random().nextDouble() *0xFFFFFF).toInt()
              ).withOpacity(0.2),
              child: InkWell(
                onTap: (){
                  Navigator.push((context),MaterialPageRoute(builder: (context) => BookProcess(bookId: book.id,)));},
                splashColor: Color((math.Random().nextDouble() *0xFFFFFF).toInt()
              ).withOpacity(0.5),
            ))
            ),
            Material(
              elevation:12,
              shadowColor: Colors.grey[600],
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(8)),
              ),
              child: Icon(Icons.book, color: Colors.black.withOpacity(0.8)),
            ),
          ],
        ),
        buildInfo(context),
      ],
    );
  }
  String getAuthors(List<Author> auth){
    int i;
    String tes;
    String res = "";
    for (i=0;i<auth.length;i++){
      tes=auth[i].name + " ";
      res += tes;
    }
    return res;
  }
  Widget getImage(String imageUrl){
    if (imageUrl=="ISBN for this book is undefined. If you think this is incorrect, please update this book without changing any fields. If this message is repeated contact a superUser."){
      Widget image = Image.asset("assets/default book cover.png",fit: BoxFit.cover,);
      return image;
    }
    else{
      Widget image = FadeInImage( image: NetworkImage(imageUrl), placeholder: AssetImage("assets/default book cover.png"),fit: BoxFit.cover,);
      return image;
    }
  }
  bool getType(String imageUrl){
    if (imageUrl=="ISBN for this book is undefined. If you think this is incorrect, please update this book without changing any fields. If this message is repeated contact a superUser."){
      return false;
    }
    else {
        return true;
    }
  }
  Widget buildInfo(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4),
        Text(book.title, style: TextStyle(fontWeight: FontWeight.bold,shadows: [Shadow(offset: Offset(0.5,0.5),blurRadius: 1.5)])),
        SizedBox(height: 4),
        Text(book.author==null?getAuthors(book.authors):book.author, style: Theme.of(context).textTheme.caption)
      ],
    ),
  );
}
