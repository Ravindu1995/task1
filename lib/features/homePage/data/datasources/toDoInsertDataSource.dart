import 'package:TODO/core/error/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoInsertDataSource {
  Future<String> insertTask(String title, String task);
}

class ToDoInsertDataSourceImpl implements ToDoInsertDataSource {
  final FirebaseFirestore firebaseFirestore;

  ToDoInsertDataSourceImpl({@required this.firebaseFirestore})
      : assert(firebaseFirestore != null, 'this datasource cant be null');

  @override
  Future<String> insertTask(String title, String task) async {
    try {
      final res = await firebaseFirestore.collection(title).add({
        'title': title,
        'task': task,
      });
      if (res != null) {
        return 'Insered Successfully';
      }
      throw Exception('Error cannot write');
    } on FirebaseException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
