
import 'package:bsruhorpak/resigter.dart';
import 'package:bsruhorpak/singup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bsruhorpak/login.dart';

// import 'package:bsruhorpak/splashscreen.dart';
// import 'package:bsruhorpak/home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSRUHORPAK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/':(_) => Login(),
        // '/login':(_) => LoginPage(),
        '/register':(_) => RegisterPage(),
        '/singup':(_ )=> MySignUpPage()
        // '/register':(_) => RegisterPage(),
        },
    );
  }
}

class LoginPage {
}


