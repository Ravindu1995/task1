//import 'package:TODO/features/TODO/presentation/Constatnts.dart';
//import 'package:TODO/features/TODO/presentation/Profile.dart';
import 'package:TODO/features/homePage/presentation/widgets/homePageFormWidget.dart';
import 'package:TODO/features/profile/presentation/pages/Constatnts.dart';
import 'package:TODO/features/profile/presentation/pages/profileView.dart';
import 'package:TODO/features/signOut/presentation/pages/signOutView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  bool selected = true;
  // final _pages = [
  //   HomePage(),
  //   Profile(),
  // ];
 
//int _selectedPage = 0;

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
        //currentIndex: _selectedPage,
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
        physics: BouncingScrollPhysics(),
        child: HomePageFormWidget(),
      ),

      // bottomNavigationBar:
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.Settings) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Profile()),
    // );
    Get.to(() => Profile());
  } else if (choice == Constants.SignOut) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginPage()),
    // );
    Get.to(SignOutView());
  }
}
