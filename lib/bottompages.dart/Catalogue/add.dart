import 'dart:ui';

import 'package:flutter/material.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/book-7.jpg"),
        fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          title:Text("Update Catalogue",
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
                body: Padding(
          padding: EdgeInsets.fromLTRB(8,5, 5, 0),
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        child: Center(
                          child: Text(
                            '"Today a reader.\n Tomorrow a leader"',
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                               ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(50)
                  ),
                  margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
                  color: Colors.transparent,
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,20,0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height:40,),
                          Center(
                            child: Text("Book Card",
                            style:TextStyle(fontSize: 30,
                            color:Colors.white70,
                            fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.title,color: Colors.white,),
                              hintText: 'Title',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),
                          ),
                          ),
                          SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle,color: Colors.white,),
                                hintText: 'Author(s)',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15)),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.language,color: Colors.white,),
                                hintText: 'Language',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),)
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.web,color: Colors.white,),
                                hintText: 'Goodreads URL',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.pages,color: Colors.white,),
                                hintText: 'Total Pages',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.book,color: Colors.white,),
                                hintText: 'Format',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.merge_type,color: Colors.white,),
                                hintText: 'Genre(s)',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.code,color: Colors.white,),
                                hintText: 'ISBN',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.comment,color: Colors.white,),
                                hintText: 'Summary',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.money_off,color: Colors.white,),
                                hintText: 'Price',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.arrow_back,color: Colors.white,),
                                hintText: 'Availability',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                                                  SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.timer,color: Colors.white,),
                                hintText: 'Year',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                          SizedBox(height:5,),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_box,color: Colors.white,),
                                hintText: 'Username',
                                hintStyle: TextStyle(color:Colors.white,
                                fontSize:15),),
                          ),
                          SizedBox(height:30),
                          Center(
                            child:OutlineButton(onPressed: (){},
                            child: Text("Add Card"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            borderSide: BorderSide(color: Colors.white),
                           textColor: Colors.white,),),
                           SizedBox(height:20)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height:50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}