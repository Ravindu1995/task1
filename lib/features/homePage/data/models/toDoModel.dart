import 'dart:convert';

import 'package:TODO/features/homePage/domain/entities/toDoList.dart';

class ToDoModel extends ToDoList {
  final String docId;
  final String title;
  final String task;
  ToDoModel({this.docId, this.title, this.task}) : super(docId, title, task);

  // factory ToDoModel.fromJson(Map<String, dynamic> json) {
  //   return ToDoModel(docId: json[''], title: json['title'], task: json['task']);
  // }

  // factory ToDoModel.fromMap(DocumentSnapshot documentSnapshot) {
  //   return ToDoModel(
  //     docId: documentSnapshot.data()[''],
  //     title: documentSnapshot.data()['title'],
  //     task: documentSnapshot.data()['task'],
  //   );
  // }

  // Map<String, dynamic> toDocument() {
  //   return {
  //     'docId': docId,
  //     "title": title,
  //     "task": task,
  //   };
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': docId,
      'title': title,
      'task': task,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      docId: map['id'],
      title: map['title'],
      task: map['task'],
    );
  }
}
