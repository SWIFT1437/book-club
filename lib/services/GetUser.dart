import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:tutorial/model/DataUser.dart';


Future<DatabaseUser> getUser(String uid) async{

  Map jsonmap = {
    "email" : "app@book.club",
    "password" : "android@superUser"
  };

  String url = "https://frigid-fox.herokuapp.com/v1/users/search/query?fid=";
  var jsonbody = json.encode(jsonmap);
  final response = await http.post(url+uid,
  headers: {"Content-Type" : "application/json"},
  body: jsonbody
  );
  if (response.statusCode ==200){
  final responseString = response.body;

  return databaseUserFromJson(responseString);
}else{
  return null;
}
}