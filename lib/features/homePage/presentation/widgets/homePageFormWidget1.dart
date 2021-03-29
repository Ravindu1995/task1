//import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../main.dart';
import '../../../../serviceLocator.dart';

class HomePageFormWidget extends StatelessWidget {
  const HomePageFormWidget({
    Key key,
  }) : super(key: key);

  get model => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ToDoViewModel>.reactive(
        onModelReady: (model) async {
          await model.getToDoList();
        },
        builder: (context, model, widget ) {
          return Container(
            height: 800,
            width: 400,
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    TextFormField(
                      controller: model.titleController,
                      decoration: InputDecoration(
                        hintText: 'Enter title',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: model.taskController,
                      decoration: InputDecoration(
                        hintText: 'Enter task',
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   height: 40,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () async {
                            model.insertTask();
                          },
                          color: Theme.of(context).primaryColor,
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
                            model.insertTask();
                          },
                          color: Colors.green[800],
                        ),
                      
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Card(
                  color: Colors.red[100],
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    //itemExtent: 100.0,
                    shrinkWrap: true,
                    itemCount: model.allTodos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        focusColor: Colors.blue,
                        title: Text(
                          model.allTodos[index].title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          model.allTodos[index].task,
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () async {
                          // model.deleteTask
                        },
                        
                        onLongPress: () async {
                          await model.deleteTask(index);
                        },
                        
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                )),
              ],
            ),
          );
        },
        viewModelBuilder: () => locator<ToDoViewModel>());
  }
}

abstract class Stream<String>{

  Stream();
}