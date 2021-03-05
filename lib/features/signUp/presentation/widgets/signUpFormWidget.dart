import 'package:TODO/features/signUp/presentation/pages/signUpViewModel.dart';
import 'package:TODO/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key key,
  }) : super(key: key);

  get model => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, widget) {
          return Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldCustom(
                  hintText: 'name',
                  labelText: 'name',
                  controller: model.nameController,
                ),
                SizedBox(
                  width: 20.0,
                  height: 30.0,
                ),
                TextFieldCustom(
                  controller: model.emailController,
                ),
                SizedBox(
                  width: 20.0,
                  height: 30.0,
                ),
                TextFieldCustom(
                  hintText: 'password',
                  labelText: 'password',
                  controller: model.passwordContorller,
                  isObsecure: true,
                ),
                SizedBox(
                  width: 20.0,
                  height: 30.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () async{
                   await model.signUp();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Join", style: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  width: 20.0,
                  height: 50.0,
                ),
                Text(
                  "By pressing 'Join' you agree to our",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                TextButton(
                  child: Text(
                    "Terms & Condition",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () async {
                    await model.signUp();
                    //Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => HomePage()),
                    // );
                  },
                ),
                SizedBox(
                  width: 20.0,
                  height: 50.0,
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => locator<SignUpViewModel>());
  }
}

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isObsecure;
  final TextEditingController controller;
  const TextFieldCustom({
    Key key,
    this.hintText,
    this.labelText,
    this.isObsecure = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(40.0),
          ),
        ),
        labelText: labelText ?? 'Email',
        hintText: hintText ?? 'Enter valid mail id ',
      ),
    );
  }
}
