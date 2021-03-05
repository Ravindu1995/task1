import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoDataSource {
  Future<List<ToDoModel>> getTodoList();
}

class ToDoDataSourceImpl implements ToDoDataSource {
  final FirebaseFirestore firestore;

  ToDoDataSourceImpl({@required this.firestore})
      : assert(firestore != null, 'this datasource cant be null');

  @override
  Future<List<ToDoModel>> getTodoList() async{
    List<String> todoList = [];
    try {
      final res = await firestore.collection(
          todoList.add(docTask.fromMap());
    });
    return todoList;
  }throw AuthException(message: 'Cannot login at the time');
  
  }
}
