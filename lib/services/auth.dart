import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutorial/model/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User _userFromFirebaseUser(FirebaseUser user) {
    bool _vool;
    if (user!= null){
    if (user.isEmailVerified){
      _vool = true;
    }
    else{
      _vool = false;
    }
    }
    return user != null ? User(uid: user.uid,vool: _vool) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email , String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if (user!= null)
      {
      if (user.isEmailVerified){
      return _userFromFirebaseUser(user);}
      else {
       await  _auth.signOut();
       return "UNVERIFIED";
      }
      }
      else{
        return null;
      }
    }catch(e){
      print(e.toString());
      return null ;
    }
  }


  Future registerWithEmailAndPassword(String email , String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if (user!=null){
      await user.sendEmailVerification();
      await _auth.signOut();
      return _userFromFirebaseUser(user);
      }
      else{
        return null;
      }
    }catch(e){
      print(e.toString());
      return null ;
    }
  }
  Future isEmailVerified() async {
    try{
      FirebaseUser user = await _auth.currentUser();
      if (user.isEmailVerified){
        return true;
      }
      else{
        return false;
      }
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}