import 'package:TODO/features/TODO/presentation/constatnts.dart';
import 'package:TODO/features/login/presentation/pages/login.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What to do',
        ),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            //scaffoldKey.currentState.showSnackBar(snackBar);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              //scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Today",
                style: TextStyle(fontSize: 30),
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Text('saddoigooisoijoroijrf'),
                    leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: CircleAvatar(),
                      ),
                    ),
                    title: Text('title'),
                    dense: false,
                  );
                },
              )
              /*ListTile(
                leading: CircularCheckBox(
                    value: this.selected,
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    inactiveColor: Colors.redAccent,
                    disabledColor: Colors.grey,
                    onChanged: (val) => this.setState(() {
                          this.selected = !this.selected;
                        })),
                title: Text("Click me"),
                onTap: () => this.setState(() {
                  this.selected = !this.selected;
                }),
              ),*/
            ],
          ),
        ),
      ),
      // bottomNavigationBar:
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else if (choice == Constants.SignOut) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
