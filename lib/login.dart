import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller/auth_controller.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keyForm = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  AuthController authController;
  void _onLogin() {
    if (keyForm.currentState.validate()) {
      keyForm.currentState.save();
      authController.onLogin(
          email: userController.text, password: passwordController.text);
    }
  }

  @override
  void initState() {
    super.initState();
    authController = AuthController(context);
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
        backgroundColor: Colors.red[50],
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child:
                            Image.asset('assets/logohorpak.png', height: 130),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "BSRU HORPAK",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xFF904A7A),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'ลงชื่อเข้าใช้',
                    style: Theme.of(context).textTheme.headline6.copyWith(),
                  ),
                  SizedBox(height: 15),
                  Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          _createInput(
                              controller: userController, hintText: 'E-mail'),
                          _createInput(
                              controller: passwordController,
                              hintText: 'password',
                              isPassword: true)
                        ],
                      )),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: _onLogin,
                      color: Color(0xFF904A7A),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
      TextInputType keyboardType = TextInputType.text,
      bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset.zero, color: Colors.red[50], blurRadius: 0)
      ]),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        validator: (msg) {
          if (msg.isEmpty) return 'Input Invalid';

          return null;
        },
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
