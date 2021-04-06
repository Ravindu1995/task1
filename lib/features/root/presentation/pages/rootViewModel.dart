import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/root/domain/usecases/rootUsecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

const String _UserLogged = 'user_logged';
const String _UserNot_Logged = 'user_Not_logged';

class RootViewModel extends MultipleStreamViewModel {
  final RootUsecase rootUsecase;

  RootViewModel({@required this.rootUsecase})
      : assert(rootUsecase != null, 'root usecase cannot be null');

  @override
  // TODO: implement streamsMap
  Map<String, StreamData> get streamsMap => {
    _UserLogged: StreamData<User>(rootUsecase(NoParams()),),
  };
}
