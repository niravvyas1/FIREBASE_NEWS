
import 'package:firebase001/Home_screen.dart';
import 'package:firebase001/Localnotification.dart';
import 'package:firebase001/home.dart';
import 'package:firebase001/shownews.dart';
import 'package:firebase001/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>Login_screen(),
          'second':(context)=>Home(),
          'third':(context)=>Splash_screen(),
          'notification':(context)=>LocalNotification(),
          'news':(context)=>ShowNews(),
        },
      ),
  );
}