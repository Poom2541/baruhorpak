import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:1) , () {
      Navigator.pushReplacementNamed(context, '/login2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Center(
              child: Image.asset('assets/logohorpak.png',
          height: 250,),
            ),
            SizedBox(child: Text("BSRUHORPAK",style:Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.purple,
              fontSize: 20,
               fontWeight: FontWeight.bold,
            ),)),
  
      
          
            
          ],
          
          // // child:Image.asset('assets/logohorpak.png',
          // // height: 250,
          
          // ),

          // Column(
          //   children: [
          //     Text('BSRUHORPAK'),
          //   ],
          // )
        ),
      ),
    );
    
  
  }
}
