import 'package:flutter/material.dart';
import 'package:tutorial/sidepages/aboutus.dart';
import 'package:tutorial/sidepages/borrowed.dart';
import 'package:tutorial/sidepages/settings.dart';
import 'package:tutorial/sidepages/profile.dart';
import 'package:tutorial/sidepages/developer.dart';
import 'package:tutorial/services/auth.dart';
import 'package:tutorial/model/DataUser.dart';

class NavDrawer extends StatelessWidget {
  final DatabaseUser udata;
  NavDrawer({this.udata});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[500],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[350],),
              currentAccountPicture: CircleAvatar(
                radius: 50,
              ),
              accountName:Text(
                udata.users[0].name,
                style: TextStyle(color: Colors.grey[900], fontSize: 20),
              ),
              accountEmail: Text(udata.users[0].email,style: TextStyle(color: Colors.grey[900], fontSize: 15),),


            ),
            ListTile(
              leading: Icon(Icons.account_box,color: Colors.grey[900],),
              title: Text('Profile',style: TextStyle(color:Colors.grey[900]),),
              onTap: () => {Navigator.of(context).pop(),Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(data: udata,))),}
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.grey[900],),
              title: Text('Settings',style: TextStyle(color:Colors.grey[900]),),
              onTap: () => {Navigator.of(context).pop(),Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()))},
            ),
            ListTile(
              leading: Icon(Icons.developer_mode,color: Colors.grey[900],),
              title: Text('Developer',style: TextStyle(color:Colors.grey[900]),),
              onTap: () => {Navigator.of(context).pop(),Navigator.push(context, MaterialPageRoute(builder: (context) => Developers()))},
            ),
            ListTile(
              leading: Icon(Icons.library_books,color: Colors.grey[900],),
              title: Text('Borrowed Books',style: TextStyle(color:Colors.grey[900]),),
              onTap: () => {Navigator.of(context).pop(),Navigator.push(context, MaterialPageRoute(builder: (context) => Borrowed()))},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.grey[900],),
              title: Text('Logout',style: TextStyle(color:Colors.grey[900]),),
              onTap: () async {Navigator.of(context).pop();await _auth.signOut();},
            ),
                        ListTile(
              leading: Icon(Icons.info,color: Colors.grey[900],),
              title: Text('About Us',style: TextStyle(color:Colors.grey[900]),),
              onTap: () => {Navigator.of(context).pop(),Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()))},
            ),
                        Divider(color: Colors.grey[900],
            height: 8,thickness: 1,),
          ],
        ),
      ),
    );
  }
}