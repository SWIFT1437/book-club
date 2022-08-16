import 'dart:ui';

import 'package:tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/shared/Loading.dart';
import 'package:tutorial/services/Create.dart';
import 'package:tutorial/model/DatabaseUser.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  DatabaseProfile _databaseProfile;
  bool loading = false;
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  bool type = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/book-1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.fromLTRB(8,50, 5, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                Container(
                  height: 70,
                  width: double.maxFinite,
                  child: ClipRRect( // make sure we apply clip it properly
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 07, sigmaY: 7),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'BOOK CLUB',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black54,
                                offset: Offset(20.0,20.0)
                              )
                            ],
                            fontFamily: 'Courgette',
                            color: Colors.black,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Icon(
                    Icons.book,
                    color: Colors.grey[900],
                    size: 40.0,
                  ),
                ),
                Divider(
                  height: 2.0,
                  //thickness: 2.0,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 2.0,),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        child: Center(
                          child: Text(
                            '"Think before you speak \n Read before you think"',
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              color: Colors.grey[850],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.0,),
                Divider(
                  height: 2.0,
                  //thickness: 2.0,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 20.0,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                  margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
                  color: Colors.transparent,
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 15,),
                          TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  hintText: 'USERNAME'
                              ),
                            validator: (val) => val.isEmpty ? 'Enter a Usename' : null ,
                              onChanged: (val) {
                                setState(() => name = val);
                              }
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: 'EMAIL'
                              ),
                            validator: (val) => val.isEmpty ? 'Enter an email' : null ,
                              onChanged: (val) {
                                setState(() => email = val);
                              }
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: 'PASSWORD'),
                            validator: (val) => val.length < 8 ? 'Enter a password 8+ char long' : null ,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Apply for Admin",style: TextStyle(color:Colors.white,fontSize: 15,),),
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.transparent,
                                hoverColor: Colors.white70,
                              value: type,
                              onChanged: (value) {
                              setState(() {
                               type = value;
                                            });
                                              },
                                                ),
                            ],
                          ),

                          SizedBox(height: 15.0,),
                          OutlineButton(
                            borderSide: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            textColor: Colors.white,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async{
                              if (_formkey.currentState.validate()){
                                setState(() => loading = true);
                               dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                               if (result == null){
                                 setState(() {
                                   error = 'Enter a valid email';
                                 loading = false;
                                 });
                               }
                               else { 
                                 String uid= result.uid;
                                 final DatabaseProfile databaseprofile = await createUser(email, password, type, name, uid);
                                 setState(() {
                                   _databaseProfile=databaseprofile;
                                   error = "A verification email was sent to the registered email account.Check your inbox and verify your email.";
                                 loading = false;
                                 });
                               }
                              }
                            },
                          ),
                          SizedBox(height: 5,),
                          Center(
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  color: Colors.white
                              ),),
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 40,),
                              Text(
                                "Already have an account ?",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(width: 3,),
                              FlatButton(
                                color: Colors.transparent,
                                child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                                onPressed: () {
                                  widget.toggleView();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                    SizedBox(height: 2,),
                      Text(
                    error,
                  style : TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,))
              ],
            ),
          ),
        )
      )
    );
  }
}
