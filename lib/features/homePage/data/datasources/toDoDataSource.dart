//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';

abstract class ToDoDataSource {
  Future<List<ToDoModel>> getTodoList();
  Future<void> deleteTask(String docID);
  Future<void> insertTask(String title, String task);
  Future<void> updateTask(String title, String task);
  Stream<List<ToDoModel>> getListOfTodo();
}

class ToDoDataSourceImpl implements ToDoDataSource {
  final FirebaseFirestore firestore;

  final Uuid uuid;

  ToDoDataSourceImpl({
    @required this.firestore,
    @required this.uuid,
  }) : assert(firestore != null, 'this datasource cant be null');

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
  Stream<List<ToDoModel>> getListOfTodo() {
    return firestore.collection('todo').snapshots().map(
        (abc) => abc.docs.map((bcd) => ToDoModel.fromMap(bcd.data())).toList());
  }

  @override
  Future<void> deleteTask(String docID) async {
    try {
      return await firestore.collection('todo').doc(docID).delete();

      //throw Exception('Cannot Delete Task');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }

  @override
  Future<void> insertTask(String title, String task) async {
    try {
      final uid = uuid.v1();
      await firestore
              .collection('todo')
              .doc(uid)
              .set({'id': uid, 'title': title, 'task': task})

          //data.map((e)=>ToDoModel.toMap());
          //ToDoModel.toMap() => docs.map()
          ;
      //throw Exception('Error cannot write');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }

  @override
  Future<void> updateTask(String title, String task) async {
    try {
      final uid = uuid.v1();
      return await firestore
          .collection('todo')
          .doc(uid)
          .update({ 'id' : uid ,'title': title, 'task': task});

      //throw Exception('Cannot Update list');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
