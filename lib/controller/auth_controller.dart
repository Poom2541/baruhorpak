import 'package:flutter/cupertino.dart';

class AuthController {
  
  final BuildContext _context;

  AuthController(BuildContext context) : _context = context;

  onLogin({
      @required String email,
      @required String password,

    
   }) async{
     try {
     
       
        Navigator.pushReplacementNamed(_context,'./home');
     } catch(e){
      
     }
   }
  // onRegister({    //รอแก้ไข
  //     @required String email,
  //     @required String password,
  //   })async{
  //    try {
     
       
  //       Navigator.pushReplacementNamed(_context,'./Re');
  //    } catch(e){
      
  //    }
     
  //    );
     
     
}