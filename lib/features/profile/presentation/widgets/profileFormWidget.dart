import 'package:TODO/features/TODO/presentation/homeView.dart';
import 'package:flutter/material.dart';

class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
