import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
//import 'package:TODO/core/error/failures.dart';

//import 'package:TODO/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoDataSource {
  Future<List<ToDoModel>> getTodoList();
}

class ToDoDataSourceImpl implements ToDoDataSource {
  final FirebaseFirestore firestore;

  ToDoDataSourceImpl({@required this.firestore})
      : assert(firestore != null, 'this datasource cant be null');
//* List<TodoModels>
  @override
  Future<List<ToDoModel>> getTodoList() async {
    try {
     
      final res = await firestore.collection('todo').get();
      if (res !=null&& res.docs != null && res.docs.isNotEmpty) {
        return res.docs.map((e) => ToDoModel.fromMap(e.data())).toList();
      }
      throw Exception('Cannot Load list');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
