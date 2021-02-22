import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What to do'),
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
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              //scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: Container(
        child: Center(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            //title: Text("Search"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            //title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            //title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            //title: Text("Home"),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
