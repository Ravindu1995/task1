import 'package:TODO/features/root/data/datasources/rootDataSource.dart';
import 'package:TODO/features/root/domain/repositories/rootRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RootRepositoryImpl implements RootRepository {
  final RootDataSource rootDataSource;

  RootRepositoryImpl({@required this.rootDataSource})
  : assert(rootDataSource != null, 'Data source cannot be null');

  @override
  Future<bool> isUserLoggedIn() async {
    // TODO: implement isUserLoggedIn
    
      return await rootDataSource.isUserLoggedIn();
    
  }

  @override
  // TODO: implement authStateChange
  Stream<User> get authStateChange => rootDataSource.authStateChange;
  
  
  }
