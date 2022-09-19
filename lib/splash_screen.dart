import 'dart:async';

import 'package:firebase001/Auth.dart';
import 'package:firebase001/Home_screen.dart';
import 'package:firebase001/home.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    check(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("SPLASH SCREEN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black),),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void check(BuildContext context){

    if(Auth().currentUser(context)==true){
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
          return Home();
        }));
    });
    }
    else{
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
          return Login_screen();
        }));
      });
    }
  }
}
