import 'package:bsruhorpak/register.dart';
import 'package:flutter/material.dart';
import 'package:bsruhorpak/splashscreen.dart';
// import 'package:bsruhorpak/home.dart';
void main() async {
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
        '/':(_) => SplashScreen(),
        // '/login':(_) => RegisterPage(),
        // '/home':(_) => HomePage(), 
        '/register':(_) => RegisterPage(),
        },
    );
  }
}


