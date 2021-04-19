import 'package:TODO/features/login/presentation/pages/loginViewModel.dart';
import 'package:TODO/features/login/presentation/widgets/loginFormWidget.dart';
import 'package:TODO/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, widget) {
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
                            style: TextStyle(
                                fontSize: 40, color: Colors.blueAccent)),
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
        },
        viewModelBuilder: () => locator<LoginViewModel>());
  }
}
