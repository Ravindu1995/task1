import 'package:TODO/features/profile/presentation/widgets/profileFormWidget.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile",
                  style: TextStyle(fontSize: 40, color: Colors.blueAccent)),
              SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              Flexible(
                  child: Image.asset("assets/background.png",
                      height: 100, width: 100)),
              SizedBox(
                width: 20.0,
                height: 30.0,
              ),
              ProfileFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}