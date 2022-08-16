import 'package:flutter/material.dart';
import 'package:tutorial/model/Notice.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial/shared/loading.dart';
import 'package:tutorial/model/DataUser.dart';
import 'dart:async';
import 'package:tutorial/bottompages.dart/Notice/notice.dart';
Future<AllNotices> getNotices() async {
  String url = "https://frigid-fox.herokuapp.com/v1/notices/";
  var response = await http.get(url,headers: {"Content-Type" : "application/json"},);
  final AllNotices allNotices = allNoticesFromJson(response.body);
  print(response.body);
  return allNotices;
}

class ProcessNotice extends StatelessWidget {
  final DatabaseUser userdata;
  ProcessNotice({this.userdata});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNotices(),
      builder: (context,AsyncSnapshot<AllNotices> snapshot){
        if (snapshot.hasData){
          return NoticeView(allNotices: snapshot.data,udata: userdata,);
        }
        else{
          return Loading();
        }
      },
    );
  }
}
