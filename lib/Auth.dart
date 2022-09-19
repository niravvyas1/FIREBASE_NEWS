import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;

  void SingUP(String e1,String p1)
  {
    _auth.createUserWithEmailAndPassword(email: e1, password: p1);
  }

  void SignIN(String e1,String p1,BuildContext context)
  {
    _auth.signInWithEmailAndPassword(email: e1, password: p1).then((value)=> Navigator.pushNamed(context,'second'));
  }

  bool currentUser(BuildContext context){
    if(_auth.currentUser !=null){
      //login success
      return true;
    }
    else{
      //login failed
      return false;

    }
  }

  void signOut(BuildContext context){
    _auth.signOut().whenComplete(() => Navigator.pushNamed(context, '/'));
  }

  void googleSignIN(BuildContext context) async{

  GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

  GoogleSignInAuthentication gsa = await googleSignInAccount!.authentication;

  var credential = GoogleAuthProvider.credential(accessToken: gsa.accessToken,idToken: gsa.idToken);

  _auth.signInWithCredential(credential).whenComplete(() => Navigator.pushNamed(context, 'second'));
  }

}