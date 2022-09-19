import 'package:firebase001/RealDatabase.dart';
import 'package:firebase001/firemodal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShowNews extends StatefulWidget {
  const ShowNews({Key? key}) : super(key: key);

  @override
  _ShowNewsState createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
  TextEditingController txt_title = TextEditingController();
  TextEditingController txt_body = TextEditingController();
  TextEditingController txt_photo = TextEditingController();

  List<FireModel> l2 = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(title: Text("TODAY NEWS",),centerTitle: true,),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: RealDatabase().ReadNews(),
                  builder: (context, AsyncSnapshot snapshot) {
                    l2.clear();
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      DataSnapshot datasnapshot = snapshot.data.snapshot;
                      for (var x in datasnapshot.children) {
                        String title = x.child("title").value.toString();
                        String body = x.child("body").value.toString();
                        String photo = x.child("photo").value.toString();
                        FireModel f1 = FireModel(photo, title, body);
                        l2.add(f1);
                      }
                      return ListView.builder(
                          itemCount: l2.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text("${index+1}.${l2[index].title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    width: double.infinity,
                                    child: Image.network(l2[index].photo,fit: BoxFit.cover,),
                                    decoration: BoxDecoration(border: Border.all(width: 2)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
                                  child: Text("${l2[index].body}"),
                                )
                              ],
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
