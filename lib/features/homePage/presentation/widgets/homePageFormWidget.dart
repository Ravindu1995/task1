
import 'package:flutter/material.dart';

import '../../../../main.dart';

class HomePageFormWidget extends StatelessWidget {
  const HomePageFormWidget({
    Key key,
  }) : super(key: key);

  String get title => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Today",
            style: TextStyle(fontSize: 30),
          ),
          RadioListTile(
          title: const Text('Wake Up',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
              ),
            RadioListTile(
          title: const Text('Brush teeth',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),
            RadioListTile(
          title: const Text('Get Breakfast', style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),    
            RadioListTile(
          title: const Text('Going OUT',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),   
                      RadioListTile(
          title: const Text('Get On Bus',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
              ),
            RadioListTile(
          title: const Text('Buy newspaper',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),
            RadioListTile(
          title: const Text('Go to the office',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),    
            RadioListTile(
          title: const Text('Come Home',style: TextStyle(fontSize: 25),),
          value: todolist.todo, 
                ),  
        ],
      ),
    );
  }
}
