import 'package:tutorial/model/DatabaseUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


Future<DatabaseProfile> createUser(String email , String password , bool type , String name , String uid) async{
  String apiurl = "https://frigid-fox.herokuapp.com/v1/users";
  Map jsonmap = {
                "email": "app@book.club",
                "password": "android@superUser",
                "new": {
                  "email": email,
                  "password": password,
                  "mode" : "firebase",
                  "fid" : uid,
                  "name" : name,
                  "admin": type
                }
              };
  var jsonbody = json.encode(jsonmap);
  final  response = await http.post(apiurl,
  headers: {"Content-Type" : "application/json"},
  body: jsonbody);
if (response.statusCode ==201){
  final responseString = response.body;

  return databaseProfileFromJson(responseString);
}else{
  return null;
}

}