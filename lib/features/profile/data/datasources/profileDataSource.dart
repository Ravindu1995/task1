import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/profile/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


abstract class ProfileDataSource {
  Future<String> getUser(String uID);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore firestore;

  ProfileDataSourceImpl({@required this.firestore})
  : assert(firestore != null, 'this datasource cant be null');

  @override
  Future<String> getUser(String uID) async {
    try {
      final res = await firestore.collection('users').doc(uID).get();
      if (res != null && res.docs != null && res.docs.isNotEmpty) {
        return res.docs.map((e) => UserModel.fromMap(e.data())).;
      }
      throw Exception('Cannot take User');
    } on FailException catch (e) {
      throw FailException(message: e.message);
    } on Exception catch (e) {
      throw FailException(message: e.toString());
    }
  }


  
}
