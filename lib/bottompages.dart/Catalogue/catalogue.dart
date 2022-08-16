import 'package:tutorial/model/Book.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tutorial/bottompages.dart/Catalogue/ShowcaseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tutorial/model/DataUser.dart';


class Catalogue extends StatefulWidget {
  Catalogue({this.udata,this.allBooks});
  final DatabaseUser udata;
  final AllBooks allBooks;
  @override
  _CatalogueState createState() => _CatalogueState();
}
class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(12),
            crossAxisCount: 4,
            mainAxisSpacing: 24,
            crossAxisSpacing: 12,
            itemCount: widget.allBooks.count,
            itemBuilder: (BuildContext context, int index) =>
                ShowcaseWidget(book : widget.allBooks.books[index]),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          ),
        ],
      );
  }
}