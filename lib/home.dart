import 'package:firebase001/Auth.dart';
import 'package:firebase001/RealDatabase.dart';
import 'package:firebase001/firemodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt_title = TextEditingController();
  TextEditingController txt_body = TextEditingController();
  TextEditingController txt_photo = TextEditingController();

  List<FireModel> l2 = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Auth().signOut(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txt_title,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txt_body,
                decoration: InputDecoration(hintText: "Body"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txt_photo,
                decoration: InputDecoration(hintText: "Photo"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  RealDatabase()
                      .addNews(txt_title.text, txt_body.text, txt_photo.text);
                },
                child: Text("ADD NEWS"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'news');
                },
                child: Text("TODAY NEWS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
