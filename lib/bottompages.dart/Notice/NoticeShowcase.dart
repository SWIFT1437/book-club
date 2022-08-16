import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:tutorial/model/Notice.dart';
import 'dart:math';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<String> getSender(String id)async{
String url = "https://frigid-fox.herokuapp.com/v1/users/"+id;
Map jsonMap = {
	"email": "app@book.club",
    "password": "android@superUser"
};
var jsonbody = json.encode(jsonMap);
var response = await http.post(url,headers: {"Content-Type" : "application/json"},body: jsonbody);
if(response.statusCode==200){
return  response.body;
}else{
return null;
}

}

class ShowNotice extends StatelessWidget {
  ShowNotice({this.notice});
  final Notice notice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomPaint(
          painter: ClipRThread(8),
          child: Container(
            constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width*(0.85)),
            child: Padding( 
              padding: const EdgeInsets.fromLTRB(40,18,40,18),
              child: Column(
                children: <Widget>[
                 Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                    Text(notice.createdBy==null?"app@book.club":notice.createdBy,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                 ],),
                 SizedBox(height:10),
                Text(notice.title,style: TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold),),
                SizedBox(height:15),
                Html(data: notice.body,shrinkWrap: true,style: {
                  "html":Style(margin: EdgeInsets.fromLTRB(0, 0, 60, 0),fontSize: FontSize(10)),
                },),
                SizedBox(height:5),
                Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                  Text(notice.updatedAt.day.toString(),style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text("/",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text(notice.updatedAt.month.toString(),style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text("/",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text(notice.updatedAt.year.toString(),style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),)
                ],),
                SizedBox(height:2),
                 Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                  Text(notice.updatedAt.hour.toString(),style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text(":",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                  Text(notice.updatedAt.minute.toString(),style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                ],)
              ],)
            ),
          ),
        ),
        SizedBox(height:16) 
      ],
    );
  }
}

class ClipRThread extends CustomPainter {
  final double chatRadius;

  ClipRThread(this.chatRadius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var rect = Offset.zero & size;
    var path = Path();
     paint.shader = LinearGradient(end: Alignment.topRight,
  begin: Alignment.bottomLeft,colors: [Colors.grey,Colors.white]).createShader(rect);
    paint.style = PaintingStyle.fill;
    path.lineTo(0.0, chatRadius);
    // path.lineTo(chatRadius, chatRadius + chatRadius / 2);
    final r = chatRadius;
    final angle = 0.785;
    path.conicTo(
      r - r * sin(angle),
      r + r * cos(angle),
      r - r * sin(angle * 0.5),
      r + r * cos(angle * 0.5),
      1,
    );

    final moveIn = 2 * r; // need to be > 2 * r
    path.lineTo(moveIn, r + moveIn * tan(angle));

    path.lineTo(moveIn, size.height - chatRadius);

    path.conicTo(
      moveIn + r - r * cos(angle),
      size.height - r + r * sin(angle),
      moveIn + r,
      size.height,
      1,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}