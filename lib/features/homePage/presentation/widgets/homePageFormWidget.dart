//import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';
import 'package:TODO/features/homePage/presentation/widgets/const.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import '../../../../serviceLocator.dart';

class HomePageFormWidget extends StatelessWidget {
  const HomePageFormWidget({
    Key key,
  }) : super(key: key);

  //get model => null;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ToDoViewModel>.reactive(
        onModelReady: (model) {
          // model.getToDoList();
        },
        builder: (_, model, widget) {
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
                      autofillHints: [AutofillHints.name],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please type something';
                        }
                        return null;
                      },
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

                        // RaisedButton(
                        //   child: Text(
                        //     'Sign Out',
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        //   onPressed: () async {
                        //     model.signOut();
                        //   },
                        //   color: Theme.of(context).primaryColor,
                        // ),
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
                    itemCount: model.todos != null ? model.todos.length : 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        focusColor: Colors.blue,
                        title: Text(
                          model.todos[index].title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          model.todos[index].task,
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () async {
                          showDialog(
                            context: Get.context,
                            child: Popup(
                              toDoViewModel: model,
                            ),
                          );
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

// void popup() async {
//       await showMenu(

//         position: RelativeRect.fromLTRB(100, 100, 100, 100),
//         items: [
//           PopupMenuItem(
//             value: 1
//             child: Text("View"),
//           ),
//           PopupMenuItem(
//              value: 2
//             child: Text("Edit"),
//           ),
//           PopupMenuItem(
//             value: 3
//             child: Text("Delete"),
//           ),
//         ],
//         elevation: 8.0,
//       ).then((value){

// // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

//       if(value!=null)
//        print(value);

//        });
//     }
