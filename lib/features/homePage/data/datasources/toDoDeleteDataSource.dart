import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:TODO/core/error/failures.dart';

abstract class ToDoDeleteDataSource {
  Future<Either<Failure, String>> deleteTask(String title);
}

class ToDoDeleteDataSourceImpl implements ToDoDeleteDataSource {
  final FirebaseFirestore firebaseFirestore;

  ToDoDeleteDataSourceImpl({@required this.firebaseFirestore})
      : assert(firebaseFirestore != null, 'this datasource cant be null');

      @override
     Future<Either<Failure, String>> deleteTask(String title) async {
        print(title);
        return await firebaseFirestore
            .collection('todo')
            .doc(title)
            .delete()
            .then((val) {
          return ;
        }).catchError((error) {
          print(error.toString());
          throw error;
        });
      }

}
