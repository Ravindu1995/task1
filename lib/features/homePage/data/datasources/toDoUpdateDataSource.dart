import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoUpdateDataSource {
  Future<String> updateTask(ToDoList toDoList);
}

class ToDoUpdateDataSourceImpl implements ToDoUpdateDataSource {
  final FirebaseFirestore firebaseFirestore;

  ToDoUpdateDataSourceImpl({@required this.firebaseFirestore})
      : assert(firebaseFirestore != null, 'this datasource cant be null');

  @override
  Future<String> updateTask(ToDoList toDoList) async {
    await firebaseFirestore
        .doc(toDoList.docId)
        .update({'title': toDoList.title, 'task': toDoList.task})
        .then((value) => print("Task Updated"))
        .catchError((error) => print("Failed to update Task: $error"));

    return 'Updated';
  }
}