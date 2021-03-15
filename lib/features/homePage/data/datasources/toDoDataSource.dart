import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';

import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

abstract class ToDoDataSource {
  Future<List<ToDoModel>> getTodoList();
  Future<String> deleteTask(String docID);
  Future<String> insertTask(ToDoList toDoList);
  Future<String> updateTask(ToDoList toDoList);
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
      if (res != null && res.docs != null && res.docs.isNotEmpty) {
        return res.docs.map((e) => ToDoModel.fromMap(e.data())).toList();
      }
      throw Exception('Cannot Load list');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }

  @override
  Future<String> deleteTask(String docID) async {
    try {
      final res =
          await firestore.collection('todo').doc(docID).delete().then((value) {
        return (true);
      });
      if (res == true) {
        return 'Deleted';
      }
      throw Exception('Cannot Delete Task');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }

  @override
  Future<String> insertTask(ToDoList toDoList) async {
    try {
      await firestore
          .collection('todo')
          .doc(toDoList.docId)
          .set({'title': toDoList.title, 'task': toDoList.task}).then((val) {
        return toDoList;
        //data.map((e)=>ToDoModel.toMap());
        //ToDoModel.toMap() => docs.map()
      });
      throw Exception('Error cannot write');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }

  @override
  Future<String> updateTask(ToDoList toDoList) async {
    try {
      await firestore
          .collection('todo')
          .doc(toDoList.docId)
          .update({'title': toDoList.title, 'task': toDoList.task}).then((val) {
        return toDoList.docId;
      });

      throw Exception('Cannot Update list');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
