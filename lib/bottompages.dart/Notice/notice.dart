import 'package:tutorial/bottompages.dart/Notice/NoticeShowcase.dart';
import 'package:tutorial/model/Notice.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/model/DataUser.dart';


class NoticeView extends StatefulWidget {
  NoticeView({this.udata,this.allNotices});
  final DatabaseUser udata;
  final AllNotices allNotices;
  @override
  _NoticeViewState createState() => _NoticeViewState();
}
class _NoticeViewState extends State<NoticeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder( 
      itemCount: widget.allNotices.count,
      padding: const EdgeInsets.all(12),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context,int index)=> ShowNotice(notice: widget.allNotices.notices[index],),
      );
  }
}