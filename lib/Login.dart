import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'main.dart';
class login extends StatefulWidget {
  static const String id ='LOGIN';
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String email;
  String password;
  final FirebaseAuth _aut = FirebaseAuth.instance;

  //Future<void>
  loginUser() async {
    FirebaseUser user = (await _aut.signInWithEmailAndPassword(
        email: email,
        password: password
    )).user;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => chat(user:user),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
           text: "Login",
           callback: () async{
             await loginUser();
           },
         ),
       ],
     ),
   );
  }
}