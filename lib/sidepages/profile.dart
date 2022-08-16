import 'package:flutter/material.dart';
import 'package:tutorial/model/DataUser.dart';
import 'package:tutorial/sidepages/profilesecond.dart';
class Profile extends StatefulWidget {
  Profile({this.data});
  final DatabaseUser data;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage("assets/book-4.jpg"),fit: BoxFit.cover
       // )
      //),
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          body:
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 0,0),
            child: SingleChildScrollView(
                          child: Column(
      children:<Widget>[
        SizedBox(
          height:250
        ),
        Text(widget.data.users[0].name,
        style:TextStyle(color: Colors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        )),
        SizedBox(height: 40,),
      Row(
        children: <Widget>[
          SizedBox(width:20),
          SizedBox(child: OutlineButton(shape:RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30.0))
,onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSecond(data: widget.data,)));
},textColor: Colors.white,child: Padding(
  padding: const EdgeInsets.fromLTRB(8,8,4,8),
  child:   Row(
  
    children: <Widget>[
  
              Text("PROFILE",style: TextStyle(letterSpacing:3)),
  
              SizedBox(width: 15,),
  
              Icon(Icons.arrow_forward,color:Colors.white)
  
    ],
  
  ),
),borderSide: BorderSide(color: Colors.white),),
height: 50,
width: 165,              ),
        ],
      )
      ]
              ),
            ),
          )
        ),
    );
  }
}