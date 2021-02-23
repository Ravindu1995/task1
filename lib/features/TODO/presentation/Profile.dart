import 'package:TODO/features/TODO/presentation/homeView.dart';
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
              Container(
                width: 250,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(40.0),
                          ),
                        ),
                        labelText: 'Full Name',
                        hintText: 'Enter Full Name ',
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(40.0),
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'Enter valid mail id ',
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(40.0),
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter your secure password'),
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Update", style: TextStyle(fontSize: 14)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
