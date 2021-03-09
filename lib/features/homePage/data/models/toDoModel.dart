import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ToDoModel extends ToDoList {

  ToDoModel({@required String docId,@required String title,@required String task}) : 
        super(docId,title , task);

        factory ToDoModel.fromJson(Map<String,dynamic> json){
          return ToDoModel(
            docId: json[''],
            title: json['title'],
            task: json['task']
          );
  }

  factory ToDoModel.fromMap(DocumentSnapshot documentSnapshot) {
    return ToDoModel(
      docId: documentSnapshot[''],
      title: documentSnapshot['title'],
      task: documentSnapshot['task'],
    );
  }

 /* Map<String,dynamic> toDocument(){
    return {
      "title":title,
      "task":task,
    };
  }*/
}
