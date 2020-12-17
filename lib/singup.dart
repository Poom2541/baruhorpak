import 'package:bsruhorpak/login.dart';
import 'package:bsruhorpak/login2.dart';
import 'package:bsruhorpak/page/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySignUpPage extends StatefulWidget {

  MySignUpPage({Key key}) : super(key: key);


  @override
  _MySignUpPageState createState() => _MySignUpPageState();
  
}
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();



TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();


class _MySignUpPageState extends State<MySignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.purple,
          title: Text("Sign up", style: TextStyle(color: Colors.white)),
        ),
      

        body: Container(
            color: Colors.red[50],
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [Colors.purple[100], Colors.purple[100]])),
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buildTextFieldPasswordConfirm(),
                      buildButtonSignUp(context)
                    ],
                  )),
            )));
  }

  Widget buildButtonSignUp(BuildContext context) {
    return InkWell(
        child: Container(
          
           constraints: BoxConstraints.expand(height: 50),
      child: Text("Sign up",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.blue),
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(12),),  
      onTap: () => signUp(),
        );
       }   
  
    
  
  


Container buildTextFieldEmail() {
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: "Email"),
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontSize: 18),
          controller: emailController,
          )
          );
}

Container buildTextFieldPassword() {
  return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration.collapsed(hintText: "Password"),
          style: TextStyle(fontSize: 18),
           controller: passwordController,
          )
          );
}

Container buildTextFieldPasswordConfirm() {
  return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration.collapsed(hintText: "Re-password"),
          style: TextStyle(fontSize: 18),
          controller: confirmController,
          )
          );
}

signUp() {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmController.text.trim();
  if (password == confirmPassword && password.length >= 6) {
   _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((email) {
      print("สมัครได้.");
    Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyLoginPage()),
            ModalRoute.withName('/'));
    }).catchError((error) {
      print(error.message);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  } else {
    
  }
  
  
}
    
}