import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stacked/stacked.dart';

import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';

class Popup extends StatelessWidget {
  final ToDoViewModel toDoViewModel;
  
  const Popup({
    Key key,
   @ required this.toDoViewModel,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      child: Container(
        height: 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: toDoViewModel.title1Controller,
                    decoration: InputDecoration(
                      //hintText: 'Edit title',
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),

                  SizedBox(
                      height: 10,
                    ),
                  TextFormField(
                    controller: toDoViewModel.task1Controller,
                    decoration: InputDecoration(
                      hintText: 'Edit task',
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),

                  RaisedButton(
                          child: Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () async {
                           //await toDoViewModel.updateTask(index);
                          },
                          color: Colors.green[800],
                        ),
                  
                ],
              ),
            ]),
      ),
    );
  }
}
