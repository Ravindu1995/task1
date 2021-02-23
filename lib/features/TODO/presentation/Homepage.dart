import 'package:TODO/features/TODO/presentation/Profile.dart';
import 'package:TODO/features/TODO/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:TODO/features/TODO/presentation/Constatnts.dart';
import 'package:TODO/features/TODO/presentation/Signup.dart';

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Today"),
            ListTile(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
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
