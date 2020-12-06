import 'package:bsruhorpak/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //ฟังชั่น
  final keyForm = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  AuthController authController;
  // void _onRegister(){
  //   authController.onRegister(email: userController.text, password: passwordController.text)
  // } อันนี้ยังทำไม่เป็น กำลังหาทางแก้ ให้link ไปหน้าจะสมัครสมาชิก
  void _onLogin() {
    if (keyForm.currentState.validate()) {
      keyForm.currentState.save();
      authController.onLogin(
          email: userController.text, password: passwordController.text);
    }

    @override
    void initState() {
      super.initState();
      authController = AuthController(context);
    }
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 55),
                      child: Image.asset(
                        'assets/logohorpak.png',
                        height: 154,
                        width: 154,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      onPressed: _onLogin, //ต้องเปลี่ยน
                      color: Color(0xFF4066B1),
                      padding: EdgeInsets.symmetric(vertical: 20),

                      child: Text(
                        // Image.asset('assets/facebook.png'

                        // ),
                        'เข้าสู่ระบบด้วยFacebook',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      onPressed: _onLogin,
                      color: Color(0xFF904A7A),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Text(
                        'หรือ',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      onPressed: _onLogin,
                     color: Color(0xFF904A7A),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'สร้างบัญชีผู้ใช้',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // font-family: Fon; //จะทำการเพิ่มfont
                            ),
                      ),
                    ),
                  ),
                ])),
          ),
        ));
  }

  Widget _createInput(
      {@required TextEditingController controller,
      @required String hintText,
      TextInputType keyboardType,
      bool isPasswprd = false //ตัวแปล
      }) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset.zero, color: Colors.purple[100], blurRadius: 0)
      ]),
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPasswprd,
        validator: (msg) {
          if (msg.isEmpty) return 'Input InValid';

          return null;
        },
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(40.0),
                ),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(40.0),
                ),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
