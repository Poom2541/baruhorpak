import 'package:bsruhorpak/page/homepage.dart';
import 'package:bsruhorpak/resetpassword.dart';
import 'package:bsruhorpak/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  var user;

  void checkAuth(BuildContext context) {}
  @override
  void initState() {
    super.initState();
    checkAuth(context);
  }
  // Future checkAuth(BuildContext context) async {
  //   FirebaseUser user = await _auth.currentUser();
  //   if (user != null) {
  //     print("Already singed-in with");
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Home()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("BSRUHORPAK", style: TextStyle(color: Colors.white)),
          ),
          body: Container(
              padding: EdgeInsets.only(top: 0),
              color: Colors.purple[50],
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            colors: [Colors.purple[50], Colors.purple[50]])),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        logo(),
                        buildTextFieldEmail(),
                        buildTextFieldPassword(),
                        buildButtonSignIn(),
                        buildOtherLine(),
                        buildButtonRegister(),
                        buildButtonForgotPassword(),
                      ],
                    )),
              ))),
    );
  }

  Widget logo() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(2),
        child: Image.asset(
          'assets/logohorpak.png',
          height: 120,
        ),
      ),
    );
  }

  Widget buildButtonSignIn() {
    return InkWell(
      child: Container(
          constraints: BoxConstraints.expand(height: 50),
          child: Text("Sing In",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.purple[700]),
          margin: EdgeInsets.only(top: 016),
          padding: EdgeInsets.all(12)),
      onTap: () {
        signIn();
      },
    );
  }

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: "Email"),
          style: TextStyle(fontSize: 16),
          controller: emailController,
        ));
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
        ));
  }

  Widget buildOtherLine() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.black)),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("Don’t have an account?",
                  style: TextStyle(color: Colors.black))),
          Expanded(child: Divider(color: Colors.green)),
        ]));
  }

  Widget buildButtonRegister() {
    return InkWell(
        child: Container(
            constraints: BoxConstraints.expand(height: 50),
            child: Text("Sing Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue),
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12)),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MySignUpPage()));
        });
  }

  buildButtonForgotPassword() {
    return InkWell(
        child: Container(
            constraints: BoxConstraints.expand(height: 50),
            child: Text("Forget Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red[300]),
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12)),
        onTap: () => navigateToResetPasswordPage(context));
  }

  navigateToResetPasswordPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyResetPasswordPage()));
  }

  signIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("signed in ${user.user}");
      checkAuth(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((error) {
      print(error);
      print(error.message);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }
}
