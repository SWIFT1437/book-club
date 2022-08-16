import 'package:flutter/material.dart';
class Fxn{
   Fxn(this.title, this.icon, this.widgets);
  final String title;
  final IconData icon;
  final Widget widgets;
}

 /*List<Fxn> fxns = <Fxn>[
  Fxn('Catalogue', Icons.book,Catalogue() ),
  Fxn('Status', Icons.edit,    Text('Status',              style: TextStyle(color: Colors.white,
              fontSize: 40)),),
  Fxn('Notice', Icons.notifications,    Text('Notice',              style: TextStyle(color: Colors.white,
              fontSize: 40)),),
];*/