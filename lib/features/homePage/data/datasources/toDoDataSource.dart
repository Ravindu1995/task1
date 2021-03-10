import 'package:TODO/core/error/exceptions.dart';
//import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
//import 'package:TODO/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class ToDoDataSource {
  Future<List<ToDoModel>> getTodoList(String docID);
  
}

class ToDoDataSourceImpl implements ToDoDataSource {
  final FirebaseFirestore firestore;

  ToDoDataSourceImpl({@required this.firestore})
      : assert(firestore != null, 'this datasource cant be null');

  @override
  Future<List<ToDoModel>> getTodoList(String docID) async {
    
    try {
         await firestore.collection('todo').doc(docID)
    .get().
    then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } 
    });
     

      ///!
      throw Exception('Cannot Load list');
    } on FailException catch (e) {
      throw AuthException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }
}
