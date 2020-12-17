import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthController {

  final BuildContext _context;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  

  AuthController(BuildContext context) : _context = context;

  onLogin({
    @required String email,
    @required String password

  }) 
  async {
    try {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
  
  Navigator.pushReplacementNamed(_context, '/home');

  } catch (e) {
    final _e = (e as FirebaseAuthException);
    print(_e.message);
  }
  }

}