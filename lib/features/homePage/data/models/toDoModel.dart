import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoModel extends ToDoList {

  ToDoModel({String title, String task}) : 
        super(title, task);

        factory ToDoModel.fromJson(Map<String,dynamic> json){
          return ToDoModel(
            
            title: json['title'],
            task: json['task']
          );
  }

  factory ToDoModel.fromMap(DocumentSnapshot documentSnapshot) {
    return ToDoModel(
      title: documentSnapshot.data()['title'],
      task: documentSnapshot.data()['task'],
    );
  }

  Map<String,dynamic> toDocument(){
    return {
      "title":title,
      "task":task,
    };
  }
}
