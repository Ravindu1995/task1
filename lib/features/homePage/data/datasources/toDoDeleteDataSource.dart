import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:TODO/core/error/failures.dart';

abstract class ToDoDeleteDataSource {
  Future<bool> deleteTask(String docID);
}

class ToDoDeleteDataSourceImpl implements ToDoDeleteDataSource {
  final FirebaseFirestore firebaseFirestore;

  ToDoDeleteDataSourceImpl({@required this.firebaseFirestore})
      : assert(firebaseFirestore != null, 'this datasource cant be null');

      @override
     Future<bool> deleteTask(String docID) async {
        print(docID);
        return await firebaseFirestore
            .collection('todo')
            .doc(docID)
            .delete()
            .then((val) {
          return ;
        }).catchError((error) {
          print(error.toString());
          throw error;
        });
      }

}
