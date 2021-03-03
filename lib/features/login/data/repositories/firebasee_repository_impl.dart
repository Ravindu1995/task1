import 'package:TODO/features/login/data/datasources/firebase_remote_datasource.dart';
import 'package:TODO/features/login/domain/entities/users.dart';
import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';

class FireBaseRepositoryImpl implements FireBaseRepository {
       final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FireBaseRepositoryImpl({this.firebaseRemoteDataSource});


      @override
  Future<void> login(String email, String password) async =>
      await firebaseRemoteDataSource.login(email, password);

  
  } 

 