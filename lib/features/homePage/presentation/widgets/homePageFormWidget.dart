import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        builder: (context, model, widget) {
          return Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    child: Text(
                      'Save ToDo',
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
                ),
               Container(
                   height: double.infinity,
                      child: ListTile(
                        key: Key('${todolist.title}'),
                        title: Text(
                          todolist.title,
                        ),
                        subtitle: Text(todolist.task),
                        onTap: model.getToDoList(),
                        //trailing: FlatButton(
                          //onPressed: deleteTodo,
                         // child: Icon(Icons.close),
                       // ),

         ),
               ),
                
              ],
            ),
          );
        },
        viewModelBuilder: () => locator<ToDoViewModel>());
  }
}
