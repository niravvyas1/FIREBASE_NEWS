import 'package:firebase001/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {

  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  void initState(){
    super.initState();
     //Firebase.initializeApp().whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    Auth a1 = Auth();
    a1.currentUser(context);
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: txt_email,
                      decoration: InputDecoration(hintText: "Email",border: InputBorder.none,contentPadding: EdgeInsets.all(15)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration( color: Colors.black12,borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: txt_password,
                      decoration: InputDecoration(hintText: "Password",border: InputBorder.none,contentPadding: EdgeInsets.all(15)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(onPressed: (){
                          Auth a1 = Auth();
                          a1.SignIN(txt_email.text, txt_password.text, context);
                        }, child: Text("LOGIN")),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(onPressed: (){
                          Auth a1 = Auth();
                          a1.SignIN(txt_email.text, txt_password.text, context);
                        }, child: Text("GOOGLE"),style: ElevatedButton.styleFrom(primary: Colors.green),),
                      ),
                    ],
                  ),
                  TextButton(onPressed: (){
                    Auth a1 =Auth();
                    a1.SingUP(txt_email.text, txt_password.text);
                  }, child: Text("SIGN UP"))
                ],
              ),
            ),
          )
      ),
    );
  }
}
