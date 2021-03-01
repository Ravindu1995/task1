import 'package:TODO/features/controllers/authController.dart';
import 'package:TODO/features/login/presentation/widgets/loginFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              Column(
                children: [
                  SizedBox(
                    width: 20.0,
                    height: 30.0,
                  ),
                  Text("Login",
                      style: TextStyle(fontSize: 40, color: Colors.blueAccent)),
                  SizedBox(
                    width: 10.0,
                    height: 20.0,
                  ),
                ],
              ),
              Flexible(
                  child: Image.asset("assets/background.png",
                      height: 100, width: 100)),
              SizedBox(
                width: 20.0,
                height: 30.0,
              ),
              const LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
