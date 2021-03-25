import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../serviceLocator.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ViewModelBuilder<ToDoViewModel>.reactive(
            onModelReady: (model) async {
          await model.getToDoList();
        }, builder: (context, model, widget) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Row(
                    children: [
                     
                    ],
                  ),

                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.purple[100],
                      margin: EdgeInsets.all(8),
                      child: ListView.builder(
                        //shrinkWrap: false,
                        itemCount: model.allTodos.length,
                        itemBuilder: (context, index) {
                          return  ListTile(
                            title: Text(model.allTodos[index].title),
                            subtitle: Text(model.allTodos[index].task),
                            // onTap: () async {
                            //   model.getToDoList();
                            // },
                            // onLongPress: () async {
                            //   model.deleteTask();
                            // },
                            // selected: isSelected,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },viewModelBuilder: () => locator<ToDoViewModel>()),),
        
      
    );
  }
}
