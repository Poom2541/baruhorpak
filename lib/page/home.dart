import 'package:bsruhorpak/login2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
        ModalRoute.withName('/'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Home'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.white,
                onPressed: () {
                  signOut(context);
                   
                })
          ],
        
 
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'assets/logohorpak.png',
                height: 120,
              )),
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    
                    color: Colors.purple[100],
                    constraints: BoxConstraints.expand(height: 420,),
                    
                    
                    
                    child: Column(
                      
                      
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ทั้งหมด",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "ค้นหา",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Column(children: [
                          Image.asset('assets/รูปภาพ1.png',width: 400,),
                        ],)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
}
