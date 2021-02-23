import 'package:TODO/features/signUp/presentation/pages/signUpView.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40.0),
                  ),
                ),
                labelStyle: TextStyle(),
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
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Enter", style: TextStyle(fontSize: 14)),
          ),
          SizedBox(
            width: 20.0,
            height: 80.0,
          ),
          Text(
            "Don't Joined Yet !",
            style: TextStyle(fontSize: 25, color: Colors.grey),
          ),
          TextButton(
            child: Text(
              "Join",
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignPage()),
              );
            },
          ),
          SizedBox(
            width: 20.0,
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
