import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_chat/chat.dart';
import 'package:flutter_my_chat/main.dart';
class Registration extends StatefulWidget {
  static const String id ='REGISTRATION';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;
  final FirebaseAuth _aut =FirebaseAuth.instance;

  Future<void> registerUser()async{
    FirebaseUser user =(await _aut.createUserWithEmailAndPassword
      (email: email,
        password: password)).user;
   Navigator.push(
       context,
      MaterialPageRoute(
        builder: (context) => chat(user: user),
      )
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Chat"),
      ),
      body: Column(
        children: <Widget>[
          Expanded
            (child: Hero(
              tag: "Logo",
              child: Container(
                width: 120,
                child: Image.asset('assests/images/Chat.png'),
              )
          )
          ),
          SizedBox(
            height:40,
          ),
          TextField(
            keyboardType :TextInputType.emailAddress,
            onChanged: (value)=>email=value,
            decoration: InputDecoration(
                hintText: 'Enter your Email....',
                border: const OutlineInputBorder()
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your Password....',
              border: const OutlineInputBorder()
            ),
          ),
          SizedBox(
            height:50,
          ),
          CustomButton(
            text: "Registration",
           callback: () {
              Navigator.of(context).pushNamed(chat.id);
              },
          ),
        ],
      ),
    );
  }
}
