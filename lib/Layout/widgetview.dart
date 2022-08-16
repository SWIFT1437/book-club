import 'package:flutter/material.dart';
import 'package:tutorial/model/DataUser.dart';
import 'package:tutorial/services/widget.dart';
import 'Drawer.dart';
import 'package:tutorial/bottompages.dart/Catalogue/add.dart';
import 'package:tutorial/bottompages.dart/Notice/addNotice.dart';
class WidgetView extends StatefulWidget {
  const WidgetView({ /*Key key,*/ this.fxn,this.data}); //: super(key: key);

  final Fxn fxn;
  final DatabaseUser data;

  @override
  _WidgetViewState createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      drawer: NavDrawer(udata: widget.data,),
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Text('${widget.fxn.title}',style: TextStyle(color:Colors.white70,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: widget.fxn.widgets,
      floatingActionButton:widget.fxn.title=='Catalogue'?widget.data.users[0].admin? FloatingActionButton(tooltip:"Add Book",onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> Add()));},backgroundColor:Colors.grey[600],child:Icon(Icons.add,color:Colors.white),elevation:16,heroTag: "btn1",):FloatingActionButton(tooltip:"Add Book",onPressed: (){showAlertDialog(context);},backgroundColor:Colors.grey[600],child:Icon(Icons.add,color:Colors.white),elevation:16,heroTag: "btn2",):widget.fxn.title=="Status"?FloatingActionButton(tooltip:"Add Status",onPressed: (){},backgroundColor:Colors.grey[600],child:Icon(Icons.edit,color:Colors.white),elevation:16,heroTag: "btn3",):widget.data.users[0].admin?FloatingActionButton(tooltip:"Add notice",onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>AddNotice() ));},backgroundColor:Colors.grey[600],child:Icon(Icons.add_comment,color:Colors.white),elevation:16,heroTag: "btn4",):FloatingActionButton(tooltip:"Add notice",onPressed: (){showNoticeAlertDialog(context);},backgroundColor:Colors.grey[600],child:Icon(Icons.add_comment,color:Colors.white),elevation:16,heroTag: "btn5",),
    );
  }
}
showAlertDialog(BuildContext context){
  Widget okButton = FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OK",));
  AlertDialog alert = AlertDialog(
          title : Text("Not an Admin account",style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.grey[800],
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(40))),
          content: 
              Text("Only Admins can add books to the Catalogue.Contact Superuser for Admin permissions.",style: TextStyle(color:Colors.red),),
          actions: <Widget>[
            okButton
          ],
        );

        showDialog(context: context,
        builder : (BuildContext context){
          return alert;
        });
}

showNoticeAlertDialog(BuildContext context){
  Widget okButton = FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OK",));
  AlertDialog noticealert = AlertDialog(
          title : Text("Not an Admin account",style: TextStyle(color:Colors.blue),),
          backgroundColor: Colors.grey[800],
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(40))),
          content: 
              Text("Only Admins can write Notices.Contact Superuser for Admin permissions.",style: TextStyle(color:Colors.red),),
          actions: <Widget>[
            okButton
          ],
        );

        showDialog(context: context,
        builder : (BuildContext context){
          return noticealert;
        });
}