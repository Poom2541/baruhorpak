import 'package:bsruhorpak/login2.dart';
import 'package:bsruhorpak/page/home.dart';
import 'package:bsruhorpak/page/homepage.dart';
import 'package:bsruhorpak/resetpassword.dart';
import 'package:bsruhorpak/singup.dart';
import 'package:bsruhorpak/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future checkAuth(BuildContext context) async {
  // ignore: deprecated_member_use
  FirebaseUser user = await checkAuth(context);
  if (user != null) {
    print("Already singed-in with");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    FirebaseUser user;
    return MaterialApp(
      title: 'BSRUHORPAK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => MyLoginPage(),
        // '/login': (_) => Login(),
        '/splashscreen': (_) => SplashScreen(),
        '/login2': (_) => MyLoginPage(),
        '/singup': (_) => MySignUpPage(),
        '/homepage': (_) => HomePage(),
        '/home': (_) => Home(),
        '/resetpassword': (_) => MyResetPasswordPage(),
      },
    );
  }
}
