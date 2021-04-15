import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_chat/Login.dart';
import 'package:flutter_my_chat/chat.dart';
import 'package:flutter_my_chat/registerion.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  FirebaseFirestore db = FirebaseFirestore.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id:(context) => MyHomePage(),
        Registration.id:(context)=>Registration(),
        login.id:(context)=>login(),
        chat.id:(context)=>chat(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id ='HOMESCREEN';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        width: 100,
                        child: Image.asset("assests/images/chat.png"),
                      ),
                    ),
                    Text(
                      'Mychat',
                      style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'Log In',
              callback: (){
                Navigator.of(context).pushNamed(login.id);
              },
            ),
            SizedBox(
              height:10,
            ),
            CustomButton(
              text: 'Register',
              callback: (){
                Navigator.of(context).pushNamed(Registration.id);
              },
            ),
            ]
    )
    );
  }
}
class CustomButton extends StatelessWidget{
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.blueGrey,
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200,
          height: 45,
          child:  Text(text),
        ),
      ),

    );
  }

}