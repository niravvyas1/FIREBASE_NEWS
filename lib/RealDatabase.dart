import 'package:firebase_database/firebase_database.dart';

class RealDatabase
{

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  DatabaseReference? dbRef;

  void addNews(String t1,String b1,String p1)
  {
    dbRef = firebaseDatabase.ref();
    dbRef!.child("News").push().set({"title":"$t1","body":"$b1","photo":"$p1"});
  }

  Stream<DatabaseEvent> ReadNews(){
    dbRef=firebaseDatabase.ref();
    return dbRef!.child("News").onValue;
  }
}