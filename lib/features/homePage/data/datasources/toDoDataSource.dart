import 'package:TODO/core/error/exceptions.dart';
//import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
//import 'package:TODO/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoDataSource {
  Future<List<ToDoList>> getTodoList();
}

class ToDoDataSourceImpl implements ToDoDataSource {
  final FirebaseFirestore firestore;

  ToDoDataSourceImpl({@required this.firestore})
      : assert(firestore != null, 'this datasource cant be null');

  @override
  Future<List<ToDoModel>> getTodoList() async {
    List<ToDoList> todoList = [];
    try {
      final res = await firestore.collection('todo');
      if (res.doc != null) {
        await firestore.collection('todo').doc(res.id).set({});

        return todoList;
      }

      ///!
      throw Exception('Cannot Load list');
    } on FailException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
