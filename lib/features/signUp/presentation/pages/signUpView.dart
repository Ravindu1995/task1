import 'package:TODO/features/signUp/presentation/widgets/signUpFormWidget.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  @override
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
                  Text("SignUP",
                      style: TextStyle(fontSize: 40, color: Colors.blueAccent)),
                ],
              ),
              Flexible(
                  child: Image.asset("assets/background.png",
                      height: 100, width: 100)),
              SizedBox(
                width: 20.0,
                height: 30.0,
              ),
              SignUpFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
