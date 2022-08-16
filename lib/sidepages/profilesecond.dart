import 'package:flutter/material.dart';
import 'package:tutorial/model/DataUser.dart';
const Color color1 = Color(0xff2c3e50 );
const Color color2 = Color(0xffbdc3c7);
const Color color3 = Color(0xff2c3e50 );

class ProfileSecond extends StatefulWidget {
  ProfileSecond({this.data});
  final DatabaseUser data;
  @override
  _ProfileSecondState createState() => _ProfileSecondState();
}

class _ProfileSecondState extends State<ProfileSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,colors:[
        Colors.white,Colors.white70
      ])),
      child: Scaffold(
        //appBar: AppBar(
          //centerTitle: true,
          backgroundColor: Colors.transparent,
          //title:Text("BOOK ID",
          //style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2))
        //),
        body:Stack(
            children:<Widget>[
              Content(usdata: widget.data,),
              CustomPaint(
        painter: CustomContainer(),
        child:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*(1/3),
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(0.25/6)),
         child:Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
                            child: Column(
             children: <Widget>[
               SizedBox(height:20),
                Text("BOOK ID",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30,shadows: [Shadow(
                        blurRadius:8,color:Colors.grey[800],offset:Offset(0, 7) ),],))
                //SizedBox(height: 10,),
              //CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.height*(0.25/2),child:
              //CircleAvatar(backgroundColor: Colors.black,radius: MediaQuery.of(context).size.height*(0.25/2.2),),),
              //SizedBox(height:4),
              //Text("Name",style:TextStyle(color:Colors.deepPurple[900],fontWeight:FontWeight.bold,fontSize: 22)),
              //Text("Type",style:TextStyle(color:Colors.red,fontSize: 10,fontWeight: FontWeight.bold))
              ]),
          )
        ),
        )
              ),
              Positioned(
                left: MediaQuery.of(context).size.width*(1/4.5),
                top:MediaQuery.of(context).size.height*(0.25/2),
                child:
              CircleAvatar(backgroundColor: Colors.white,radius: MediaQuery.of(context).size.height*(0.25/2),child:
              Container(decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(
              color:Colors.black,blurRadius:2,offset:Offset(0,4)
              )]),child: CircleAvatar(backgroundColor: Colors.grey,radius: MediaQuery.of(context).size.height*(0.25/2.2),)),),)
            ]
        )
      ),
    );
  }
}

class CustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var paint = Paint();
    paint.shader = LinearGradient(end: Alignment.topRight,
  begin: Alignment.bottomLeft,colors: [color1,color2,color3]).createShader(rect);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Content extends StatefulWidget {
  Content({this.usdata});
  final DatabaseUser usdata;
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
              child: Column(
          children:<Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*(1/2.5),),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.blur_circular,color: Colors.red,),
                    Text(widget.usdata.users[0].admin?"Admin":"Regular",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold,fontSize:15,letterSpacing:2,shadows: [Shadow(
                      blurRadius:2,color:Colors.red[900],offset:Offset(0, 1)
                    )]),),
                    SizedBox(width:MediaQuery.of(context).size.width*(1/3)),
                    Text("READER \nLEVEL",style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 15,letterSpacing: 2,shadows: [Shadow(
                      blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)])),
                    SizedBox(width:10),
                    Container(decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(
              color:Colors.black,blurRadius:2,offset:Offset(0,4)
            )]),
                      child: CircleAvatar(
                        child: Text(widget.usdata.users[0].issueCount.toString(),style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                        backgroundColor:Colors.black,radius:25
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                child: Container(
                  
                  decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [color1,color2,color3]),borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
                    color:Colors.grey[300],blurRadius:4,offset:Offset(10,10)
                  )]),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                    child:Padding(
                      padding: const EdgeInsets.fromLTRB(20,5, 5, 5),
                      child: Column(
                          children:<Widget>[
                            SizedBox(height:30),
                            Row(
                              children:<Widget>[
                                Icon(Icons.verified_user,color: Colors.white,size: 20,),
                                SizedBox(width:30),
                                Text(widget.usdata.users[0].name,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15,shadows: [Shadow(
                          blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                              ]
                            ),
                          SizedBox(height:10),
                            Padding(
                              padding: const EdgeInsets.only(left:50),
                              child: Divider(color:Colors.grey[800]),
                            ),
                            Row(
                              children:<Widget>[
                                Icon(Icons.mail,color: Colors.white,size: 20,),
                                SizedBox(width:30),
                                
                                  Text(widget.usdata.users[0].email,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:15,shadows: [Shadow(
                          blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                          
      
                  
                              ]
                            ),SizedBox(height:10),
                            Padding(
                              padding: const EdgeInsets.only(left:50),
                              child: Divider(color:Colors.grey[800]),
                            ),
                            Row(
                              children:<Widget>[
                                Icon(Icons.pie_chart_outlined,color: Colors.white,size: 20,),
                                SizedBox(width:30),
                                Text("Book Issued",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15,shadows: [Shadow(
                          blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                          SizedBox(width:30),
                          Text(widget.usdata.users[0].issueCount.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15,shadows: [Shadow(
                          blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]),),
                            ]
                            ),SizedBox(height:10),                        Padding(
                              padding: const EdgeInsets.only(left:50),
                              child: Divider(color:Colors.grey[800]),),
                              SizedBox(height:15)
                          ]
                        ),
                    )
                  
            
          ),
                ),
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 20, 0),
                child: Container(
                  decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [color1,color2,color3]),borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
                    color:Colors.grey[300],blurRadius:4,offset:Offset(10,10)
                  )]),
                  child: Card(
                    elevation: 16,
                     color:Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                  
                  child:Padding(
                    padding: const EdgeInsets.fromLTRB(20,5, 5, 5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:10),
                        Center(child:Text("BOOK ISSUED",style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 15,fontWeight: FontWeight.bold,shadows: [Shadow(
                        blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]))
                        ),
                        SizedBox(height:10),
                      ],
                    ),
                  )
                  ),
                )
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 20, 0),
                child: Container(
                  decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [color1,color2,color3]),borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
                    color:Colors.grey[300],blurRadius:4,offset:Offset(10,10)
                  )]),
                  child: Card(
                    elevation: 16,
                     color:Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                  
                  child:Padding(
                    padding: const EdgeInsets.fromLTRB(20,5, 5, 5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:10),
                        Center(child:Text("CART",style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 15,fontWeight: FontWeight.bold,shadows: [Shadow(
                        blurRadius:6,color:Colors.black26,offset:Offset(0, 7),)]))
                        ),
                      ],
                    ),
                  )
                  ),
                )
              )
          ]
        ),
      ),
    );
  }
}
