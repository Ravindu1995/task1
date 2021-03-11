import 'package:TODO/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoDeleteDataSource {
  Future<bool> deleteTask(String docID);
}

class ToDoDeleteDataSourceImpl implements ToDoDeleteDataSource {
  final FirebaseFirestore firebaseFirestore;

  ToDoDeleteDataSourceImpl({@required this.firebaseFirestore})
      : assert(firebaseFirestore != null, 'this datasource cant be null');

  @override
  Future<bool> deleteTask(String docID) async {
    return await firebaseFirestore
        .collection('todo')
        .doc(docID)
        .delete()
        .then((val) {
      return true;
    }).catchError((error) {
      print(error.toString());
      throw FailException(message: error.toString());
    });
  }
}
