import 'dart:ui';
import 'package:tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/shared/Loading.dart';

class LoginPage extends StatefulWidget {

  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
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
                /*RaisedButton(
                  color: Colors.transparent,
                  child: Text('Sign in anon'),
                  onPressed: ()  async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('error sign in ');
                    } else {
                      print('signed in');
                      print(result.uid);
                    }
                  },

                  ),*/
                Card(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                  margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
                  color: Colors.transparent,
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,20,0),
                      child: Column(
                        children: <Widget>[
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
                          SizedBox(height: 15.0,),
                          OutlineButton(
                            borderSide: BorderSide(color: Colors.white),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async{
                              if (_formkey.currentState.validate()){
                                setState(() {
                                  loading = true;
                                });
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                if (result == null){
                                  setState(() { error = 'Input correct Usename and Password';
                                  loading = false;
                                  });
                                }
                                else if (result == "UNVERIFIED"){
                                  setState(() { error = "Email address not verified.\n Check your inbox and \nverify your email address.";
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
                              SizedBox(width: 50,),
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(width: 3,),
                              FlatButton(
                                color: Colors.transparent,
                                child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                                onPressed: () {
                                  widget.toggleView();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                      error,
                      style : TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
